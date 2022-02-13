using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Models;
using System.Security.Claims;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.StoredProcedures;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Web_Api.online.Hubs;
using Newtonsoft.Json;
using Web_Api.online.Models.ViewModels;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Mappers;

namespace Web_Api.online.Controllers
{
    public class TradeController : Controller
    {
        private readonly WalletsRepository _walletsRepository;
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<btcusdtHub> _hubcontext;
        private readonly BotsRepository _botsRepository;
        private readonly CandleStickRepository _candleStickRepository;

        public TradeController(
            WalletsRepository walletsRepository,
            TradeRepository tradeRepository,
            BotsRepository botsRepository,
            CandleStickRepository candleStickRepository,
            IHubContext<btcusdtHub> hubcontext)
        {
            _walletsRepository = walletsRepository;
            _tradeRepository = tradeRepository;
            _botsRepository = botsRepository;
            _candleStickRepository = candleStickRepository;
            _hubcontext = hubcontext;
        }

        // GET: TradeController
        public ActionResult Index()
        {
            return View();
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

            await _tradeRepository.spMove_BTC_USDT_FromOpenOrdersToClosedOrders(order, userId, ClosedOrderStatusEnum.Canceled);

            return Ok();
        }

        [Authorize]
        [Route("trade/openorders")]
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

            if (!string.IsNullOrEmpty(orderModel.BotAuthCode))
            {
                var botAuthCode = await _botsRepository.GetBotByBotAuthCode(orderModel.BotAuthCode);

                if (botAuthCode != null)
                {
                    userId = botAuthCode.UserId;
                }
            }

            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest("You're not authorized");
            }

            decimal priceDecimal = orderModel.Price.ParseToDecimal();
            decimal amountDecimal = orderModel.Amount.ParseToDecimal();
            decimal total = priceDecimal * amountDecimal;

            decimal updatedWalletBalance;

            //Buy - USDT
            if (orderModel.IsBuy)
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, "USDT");

                if (wallet == null)
                {
                    return BadRequest("You dont have a wallets. Create them");
                }

                if (wallet.Value < total)
                {
                    return BadRequest("You dont have wallet balance.");
                }

                var updatedWallet = wallet;

                updatedWallet.Value -= total;

                updatedWalletBalance = updatedWallet.Value;

                await _walletsRepository.UpdateWalletBalanceAsync(updatedWallet);

            }
            else //Sell - BTC
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, "BTC");

                if (wallet == null)
                {
                    return BadRequest("You dont have a wallets. Create them");
                }

                if (wallet.Value < amountDecimal)
                {
                    return BadRequest("You dont have wallet balance.");
                }

                var updatedWallet = wallet;

                updatedWallet.Value -= amountDecimal;

                updatedWalletBalance = updatedWallet.Value;

                await _walletsRepository.UpdateWalletBalanceAsync(updatedWallet);
            }

            BTC_USDT_OpenOrderTableModel order = new BTC_USDT_OpenOrderTableModel
            {
                Price = priceDecimal,
                Amount = amountDecimal,
                Total = total,
                CreateUserId = userId,
                CreateDate = DateTime.Now,
            };

            var result = await _tradeRepository.spProcess_BTC_USDT_Order(order, orderModel.IsBuy);

            while (result.Amount != order.Amount && result.Amount != 0)
            {
                order.Amount = result.Amount;

                result = await _tradeRepository.spProcess_BTC_USDT_Order(order, orderModel.IsBuy);

                if (result.ClosedOrderUserId != "-1")
                {
                    await _hubcontext.Clients.User(result.ClosedOrderUserId).SendAsync("OrderWasClosed", JsonConvert.SerializeObject(result.ClosedOrderId));
                }
            }

            order.Id = result.Id;

            if (result.Id == -1)
            {
                await _hubcontext.Clients.User(userId).SendAsync("OrderWasClosed", result.Id);
            }
            else
            {
                await _hubcontext.Clients.User(userId).SendAsync("OrderWasCreated", JsonConvert.SerializeObject(order));
            }

            return Ok(updatedWalletBalance.ToString());
        }

        public async Task<ActionResult> BTCUSDT()
        {
            List<WalletTableModel> userWallets = new List<WalletTableModel>();

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            BTC_USDTViewModel model = new BTC_USDTViewModel();

            if (!string.IsNullOrEmpty(userId))
            {
                model.UserId = userId;

                userWallets = await _walletsRepository.GetUserWalletsAsync(userId);

                model.UserWallets = userWallets;

                WalletTableModel btcWallet = userWallets.FirstOrDefault(x => x.CurrencyAcronim == "BTC");

                if (btcWallet == null)
                {
                    var newbtcWallet = new WalletTableModel
                    {
                        UserId = userId,
                        CurrencyAcronim = "BTC",
                        Address = System.Guid.NewGuid().ToString().Replace("-", ""),
                        Value = 0
                    };

                    btcWallet = await _walletsRepository.CreateUserWalletAsync(newbtcWallet);
                }

                model.UserWallets.Add(btcWallet);

                model.BtcWallet = btcWallet;

                WalletTableModel usdtWallet = userWallets.FirstOrDefault(x => x.CurrencyAcronim == "USDT");

                if (usdtWallet == null)
                {
                    usdtWallet = new WalletTableModel
                    {
                        UserId = userId,
                        CurrencyAcronim = "USDT",
                        Address = System.Guid.NewGuid().ToString().Replace("-", ""),
                        Value = 0
                    };

                    usdtWallet = await _walletsRepository.CreateUserWalletAsync(usdtWallet);
                }

                model.UserWallets.Add(usdtWallet);

                model.UsdtWallet = usdtWallet;

                model.UserOpenOrders = await _tradeRepository.spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(userId);
            }

            model.BuyOrderBook = await _tradeRepository.Get_BTC_USDT_BuyOrderBookAsync();
            model.SellOrderBook = await _tradeRepository.Get_BTC_USDT_SellOrderBookAsync();
            model.MarketTrades = await _tradeRepository.spGet_BTC_USDT_ClosedOrders_Top100();

            return View(model);
        }

        public async Task<ActionResult> BTCUSDTVue()
        {
            BTC_USDTViewModel model = new BTC_USDTViewModel();

            return View(model);
        }
    }
}
