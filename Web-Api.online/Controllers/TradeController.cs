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
using Microsoft.AspNetCore.SignalR;
using Web_Api.online.Hubs;
using Newtonsoft.Json;

namespace Web_Api.online.Controllers
{
    public class TradeController : Controller
    {
        private readonly WalletsRepository _walletsRepository;
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<btcusdtHub> _hubcontext;

        public TradeController(
            WalletsRepository walletsRepository,
            TradeRepository tradeRepository,
            IHubContext<btcusdtHub> hubcontext)
        {
            _walletsRepository = walletsRepository;
            _tradeRepository = tradeRepository;
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

        public async Task<ActionResult> OpenOrders()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                return View(await _tradeRepository
                    .spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(userId));
            }

            return BadRequest("You're not authorized");
        }

        public async Task<ActionResult> ClosedOrders()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                return View(await _tradeRepository
                    .spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate("53cd122d-6253-4981-b290-11471f67c528"));
            }

            return BadRequest("You're not authorized");
        }

        [HttpPost]
        [Route("trade/createorder")]
        public async Task<ActionResult> CreateOrder([FromBody]OrderModel orderModel)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest("You're not authorized");
            }

            decimal priceDecimal = Convert.ToDecimal(orderModel.Price);
            decimal amountDecimal = Convert.ToDecimal(orderModel.Amount);
            decimal total = priceDecimal * amountDecimal;

            var wallet = await _walletsRepository
                .GetUserWalletAsync(
                    userId, 
                    orderModel.IsBuy ? "USDT" : "BTC");

            if(wallet.Value < total)
            {
                return BadRequest("You doesn't have enough money for deal");
            }

            wallet.Value -= total;
            await _walletsRepository.UpdateWalletBalance(wallet);

            BTC_USDT_OpenOrders order = new BTC_USDT_OpenOrders
            {
                IsBuy = orderModel.IsBuy,
                Price = priceDecimal,
                Amount = amountDecimal,
                Total = total,
                CreateUserId = userId,
                CreateDate = DateTime.Now,
            };

            long newId = await _tradeRepository.spCreate_BTC_USDT_Order(new Args_spAdd_BTC_USDT_OpenOrder()
            {
                IsBuy = orderModel.IsBuy,
                Amount = amountDecimal,
                Price = priceDecimal,
                Total = total,
                UserId = userId
            });

            order.OpenOrderId = newId;

            var orders = await _tradeRepository.Get_BTC_USDT_OpenOrdersAsync();

            var selectedOrders = orders.Where(x => x.IsBuy != orderModel.IsBuy && (orderModel.IsBuy ? priceDecimal >= x.Price : priceDecimal <= x.Price));

            var result = ProcessOrders(selectedOrders, order);

            if (result.UpdatedOrders != null)
            {
                foreach (var closedOrder in result.UpdatedOrders)
                {
                    if (closedOrder.RemoveOpenOrderFromDataBase == true)
                    {
                        var closedOrderUserWallet = await _walletsRepository
                            .GetUserWalletAsync(
                                closedOrder.Order.CreateUserId,
                                closedOrder.Order.IsBuy ? "BTC" : "USDT");

                        closedOrderUserWallet.Value += closedOrder.Order.Total;

                        await _walletsRepository.UpdateWalletBalance(closedOrderUserWallet);

                        await _tradeRepository
                            .spMove_BTC_USDT_FromOpenOrdersToClosedOrders(
                                closedOrder.Order,
                                order.CreateUserId,
                                ClosedOrderStatus.Completed);
                    }
                    else
                    {
                        await _tradeRepository.spUpdate_BTC_USDT_OpenOrder(closedOrder.Order);
                    }
                }
            }

            List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> openOrdersBuy = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(true);
            List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> openOrdersSell = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(false);
            List<BTC_USDT_ClosedOrders> marketTrades = await _tradeRepository.spGet_BTC_USDT_ClosedOrders_Top100();

            RecieveMessageResultModel recieveResult = new RecieveMessageResultModel()
            {
                CurrentOrder = result.IsCurrentOrderClosed ? null : order,
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades,
                IsBuy = orderModel.IsBuy
            };

            await _hubcontext.Clients.All.SendAsync("ReceiveMessage", JsonConvert.SerializeObject(recieveResult));

            return Ok();
        }

        private ProcessOrderResultModel ProcessOrders(IEnumerable<BTC_USDT_OpenOrders> selectedOrders, BTC_USDT_OpenOrders currentOrder)
        {
            if (selectedOrders.Any())
            {
                ProcessOrderResultModel processResult = new ProcessOrderResultModel();

                List<UpdatedOrderModel> updatedOrders = new List<UpdatedOrderModel>();

                decimal amountDecimal = currentOrder.Amount;
                bool isOrderClosed = false;

                foreach (var openOrder in selectedOrders)
                {
                    if (amountDecimal > openOrder.Amount)
                    {
                        amountDecimal -= openOrder.Amount;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        var localOrder = currentOrder;
                        localOrder.Amount = amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = localOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        currentOrder.Amount = amountDecimal;
                    }

                    if (amountDecimal < openOrder.Amount)
                    {
                        openOrder.Amount -= amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        currentOrder.Amount = amountDecimal;

                        isOrderClosed = true;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = currentOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        break;
                    }

                    if (amountDecimal == openOrder.Amount)
                    {
                        currentOrder.Amount = amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = currentOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        isOrderClosed = true;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        break;
                    }
                }

                processResult.UpdatedOrders = updatedOrders;
                processResult.IsCurrentOrderClosed = isOrderClosed;

                return processResult;
            }
            else
            {
                return new ProcessOrderResultModel()
                {
                    UpdatedOrders = null,
                    IsCurrentOrderClosed = false
                };
            }
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

            return View(model);
        }

        // GET: TradeController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: TradeController/Create
        public ActionResult Create()
        {
            return View();
        }


        // GET: TradeController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: TradeController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: TradeController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TradeController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
