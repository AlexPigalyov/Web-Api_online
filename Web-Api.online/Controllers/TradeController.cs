using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Repositories;
using Web_Api.online.Models;
using System.Security.Claims;
using Web_Api.online.Repositories.Abstract;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.StoredProcedures;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Web_Api.online.Hubs;
using Newtonsoft.Json;
using Web_Api.online.Models.Constants;

namespace Web_Api.online.Controllers
{
    public class TradeController : Controller
    {
        private readonly WalletsRepository _walletsRepository;
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<btcusdtHub> _hubcontext;
        private readonly BotsRepository _botsRepository;

        public TradeController(
            WalletsRepository walletsRepository,
            TradeRepository tradeRepository,
            BotsRepository botsRepository,
            IHubContext<btcusdtHub> hubcontext)
        {
            _walletsRepository = walletsRepository;
            _tradeRepository = tradeRepository;
            _botsRepository = botsRepository;
            _hubcontext = hubcontext;
        }

        // GET: TradeController
        public ActionResult Index()
        {
            return View();
        }

        public class BTC_USDTModel
        {
            public string UserId { get; set; }
            public List<Wallet> UserWallets { get; set; }
            public Wallet BtcWallet { get; set; }

            public Wallet UsdtWallet { get; set; }
            public List<BTC_USDT_ClosedOrders> MarketTrades { get; set; }
            public List<BTC_USDT_OpenOrders> UserOpenOrders { get; set; }
            public List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> BuyOrderBook { get; set; }
            public List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> SellOrderBook { get; set; }
        }

        [Authorize]
        public async Task<ActionResult> CancelOrder(long id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest("You are not authorized.");
            }

            var order = await _tradeRepository.spGet_BTC_USDT_OpenOrder_ById(id);

            if (order == null)
            {
                return BadRequest("Order with this id doesn't exist.");
            }

            if (order.CreateUserId != userId)
            {
                return BadRequest("This is not your order.");
            }

            await _tradeRepository.spMove_BTC_USDT_FromOpenOrdersToClosedOrders(order, userId, ClosedOrderStatus.Canceled);

            return Ok();
        }

        [Authorize]
        public async Task<ActionResult> OpenOrders()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                return View(await _tradeRepository
                    .spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(userId));
            }

            return Redirect("/Identity/Account/Login?ReturnUrl=%2FTrade%2FOpenOrders");
        }

        [Authorize]
        public async Task<ActionResult> ClosedOrders()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                return View(await _tradeRepository
                    .spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(userId));
            }

            return Redirect("/Identity/Account/Login%2FTrade%2FClosedOrders");
        }

        [HttpPost]
        [Route("trade/createorder")]
        public async Task<ActionResult> CreateOrder([FromBody] OrderModel orderModel)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            bool isBot = false;

            if (string.IsNullOrEmpty(userId))
            {
                if (!string.IsNullOrEmpty(orderModel.BotAuthCode))
                {
                    var botAuthCode = await _botsRepository.GetBotByBotAuthCode(orderModel.BotAuthCode);

                    if (botAuthCode.UserId != UserId.ParserBot)
                    {
                        if (botAuthCode.UserId != userId)
                        {
                            return BadRequest("You're not authorized");
                        }
                        else
                        {
                            isBot = true;
                            userId = botAuthCode.UserId;
                        }
                    }
                    else
                    {
                        isBot = true;
                        userId = botAuthCode.UserId;
                    }
                }
                else
                {
                    return BadRequest("You're not authorized");
                }
            }

            decimal priceDecimal = Convert.ToDecimal(orderModel.Price);
            decimal amountDecimal = Convert.ToDecimal(orderModel.Amount);
            decimal total = priceDecimal * amountDecimal;

            var wallet = await _walletsRepository
                .GetUserWalletAsync(
                    userId,
                    orderModel.IsBuy ? "USDT" : "BTC");

            if (wallet.Value < total)
            {
                return BadRequest("You doesn't have enough money for deal");
            }

            wallet.Value -= total;
            await _walletsRepository.UpdateWalletBalance(wallet);

            long newId = await _tradeRepository.spCreate_BTC_USDT_Order(new Args_spAdd_BTC_USDT_OpenOrder()
            {
                IsBuy = orderModel.IsBuy,
                Amount = amountDecimal,
                Price = priceDecimal,
                Total = total,
                UserId = userId
            });

            BTC_USDT_OpenOrders order = new BTC_USDT_OpenOrders
            {
                IsBuy = orderModel.IsBuy,
                Price = priceDecimal,
                Amount = amountDecimal,
                Total = total,
                CreateUserId = userId,
                CreateDate = DateTime.Now,
            };

            order.OpenOrderId = newId;

            //var orders = await _tradeRepository.Get_BTC_USDT_OpenOrdersAsync();

            //var selectedOrders = orders.Where(x => x.IsBuy != orderModel.IsBuy && (orderModel.IsBuy ? priceDecimal >= x.Price : priceDecimal <= x.Price));

            //var result = ProcessOrders(selectedOrders, order);

            var updatedAmount = await _tradeRepository.spProcess_BTC_USDT_Order(order);
            while(updatedAmount != order.Amount && updatedAmount != 0)
            {
                updatedAmount = await _tradeRepository.spProcess_BTC_USDT_Order(order);
            }
            
            //if (result.UpdatedOrders != null)
            //{
            //    foreach (var closedOrder in result.UpdatedOrders)
            //    {
            //        if (closedOrder.RemoveOpenOrderFromDataBase == true)
            //        {
            //            var closedOrderUserWallet = await _walletsRepository
            //            .GetUserWalletAsync(
            //                closedOrder.Order.CreateUserId,
            //                closedOrder.Order.IsBuy ? "BTC" : "USDT");

            //            closedOrderUserWallet.Value += closedOrder.Order.Total;

            //            await _walletsRepository.UpdateWalletBalance(closedOrderUserWallet);

            //            await _tradeRepository
            //                .spMove_BTC_USDT_FromOpenOrdersToClosedOrders(
            //                    closedOrder.Order,
            //                    order.CreateUserId,
            //                    ClosedOrderStatus.Completed);
            //        }
            //        else
            //        {
            //            await _tradeRepository.spUpdate_BTC_USDT_OpenOrder(closedOrder.Order);
            //        }
            //    }
            //}

            List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> openOrdersBuy = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(true);
            List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> openOrdersSell = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(false);
            List<BTC_USDT_ClosedOrders> marketTrades = await _tradeRepository.spGet_BTC_USDT_ClosedOrders_Top100();

            RecieveMessageResultModel recieveResult = new RecieveMessageResultModel()
            {
                CurrentOrder = updatedAmount == 0 ? null : order,
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades,
                IsBuy = orderModel.IsBuy
            };

            await _hubcontext.Clients.All.SendAsync("ReceiveMessage", JsonConvert.SerializeObject(recieveResult));

            await _hubcontext.Clients.User(userId).SendAsync("ReceiveNewOrder", updatedAmount == 0 ? null : JsonConvert.SerializeObject(order));

            return Ok();
        }

        public async Task<ActionResult> BTCUSDT()
        {
            List<Wallet> userWallets = new List<Wallet>();

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            BTC_USDTModel model = new BTC_USDTModel();

            if (!string.IsNullOrEmpty(userId))
            {
                model.UserId = userId;

                userWallets = await _walletsRepository.GetUserWalletsAsync(userId);

                model.UserWallets = userWallets;

                Wallet btcWallet = userWallets.FirstOrDefault(x => x.CurrencyAcronim == "BTC");

                if (btcWallet == null)
                {
                    btcWallet = new Wallet
                    {
                        UserId = userId,
                        CurrencyAcronim = "BTC",
                        Address = System.Guid.NewGuid().ToString().Replace("-", ""),
                        Value = 0
                    };

                    btcWallet = await _walletsRepository.CreateUserWalletAsync(btcWallet);
                }

                model.UserWallets.Add(btcWallet);

                model.BtcWallet = btcWallet;

                Wallet usdtWallet = userWallets.FirstOrDefault(x => x.CurrencyAcronim == "USDT");

                if (usdtWallet == null)
                {
                    usdtWallet = new Wallet
                    {
                        UserId = userId,
                        CurrencyAcronim = "USDT",
                        Address = System.Guid.NewGuid().ToString().Replace("-", ""),
                        Value = 0,
                        Created = DateTime.Now,
                        LastUpdate = DateTime.Now
                    };

                    usdtWallet = await _walletsRepository.CreateUserWalletAsync(usdtWallet);
                }

                model.UserWallets.Add(usdtWallet);

                model.UsdtWallet = usdtWallet;

                model.UserOpenOrders = await _tradeRepository.spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(userId);
            }

            model.BuyOrderBook = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(true);
            model.SellOrderBook = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(false);
            model.MarketTrades = await _tradeRepository.spGet_BTC_USDT_ClosedOrders_Top100();
            model.UserOpenOrders = await _tradeRepository.spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(userId);

            return View(model);
        }
    }
}
