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
        private readonly PairsRepository _pairsRepository;

        public TradeController(
            WalletsRepository walletsRepository,
            TradeRepository tradeRepository,
            BotsRepository botsRepository,
            CandleStickRepository candleStickRepository,
            PairsRepository pairsRepository,
            IHubContext<btcusdtHub> hubcontext)
        {
            _walletsRepository = walletsRepository;
            _tradeRepository = tradeRepository;
            _botsRepository = botsRepository;
            _candleStickRepository = candleStickRepository;
            _pairsRepository = pairsRepository;
            _hubcontext = hubcontext;
        }

        // GET: TradeController
        public async Task<ActionResult> Index()
        {
            var model = await _pairsRepository.GetAllPairsAsync();

            return View(model);
        }

        [Authorize]
        public async Task<ActionResult> CancelOrder(long id, string acronim)
        {
            var pair = await _pairsRepository.GetPairByAcronimAsync(acronim);

            if (pair == null) return BadRequest("Wrong pair");

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest("You are not authorized.");
            }

            var order = await _tradeRepository.GetOpenOrderById(pair.Currency1, pair.Currency2, id);

            if (order == null)
            {
                return BadRequest("Order with this id doesn't exist.");
            }

            if (order.CreateUserId != userId)
            {
                return BadRequest("This is not your order.");
            }

            await _tradeRepository.MoveFromOpenToClosedOrders(order, userId,
                ClosedOrderStatusEnum.Canceled, pair.SQLTableName);

            var wallet = await _walletsRepository
                .GetUserWalletAsync(userId, order.IsBuy ? pair.Currency2 : pair.Currency1);

            await _walletsRepository
                .UpdateUserWalletBalanceAsync(wallet.Id, order.IsBuy ? order.Total : order.Amount);

            return Redirect("crypto/" + acronim);
        }

        [Authorize]
        [Route("trade/openorders")]
        public async Task<ActionResult> OpenOrders(string pair = "BTCUSDT")
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                return View(await _tradeRepository.spGet_OpenOrders_ByUser(userId));
            }

            return Redirect("/Identity/Account/Login?ReturnUrl=%2FTrade%2FOpenOrders");
        }

        [Authorize]
        public async Task<ActionResult> ClosedOrders()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                var pairs = await _pairsRepository.GetAllPairsAsync();

                List<ClosedOrderTableModel> closedOrders = new List<ClosedOrderTableModel>();

                foreach (var pair in pairs)
                {
                    var pairClosedOrders = await _tradeRepository.spGetClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(userId, pair.SQLTableName);

                    pairClosedOrders.ForEach(p =>
                    {
                        p.Currency1 = pair.Currency1;
                        p.Currency2 = pair.Currency2;
                    });

                    closedOrders.AddRange(pairClosedOrders);
                }

                return View(closedOrders.OrderByDescending(x => x.ClosedDate));
            }

            return Redirect("/Identity/Account/Login%2FTrade%2FClosedOrders");
        }

        //[HttpPost]
        //[Route("trade/createorder")]
        //public async Task<ActionResult> CreateOrder([FromBody] OrderModel orderModel)
        //{
        //    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        //    if (!string.IsNullOrEmpty(orderModel.BotAuthCode))
        //    {
        //        var botAuthCode = await _botsRepository.GetBotByBotAuthCode(orderModel.BotAuthCode);

        //        if (botAuthCode != null)
        //        {
        //            userId = botAuthCode.UserId;
        //        }
        //    }

        //    if (string.IsNullOrEmpty(userId))
        //    {
        //        return BadRequest("You're not authorized");
        //    }

        //    decimal priceDecimal = orderModel.Price.ParseToDecimal();
        //    decimal amountDecimal = orderModel.Amount.ParseToDecimal();
        //    decimal total = priceDecimal * amountDecimal;

        //    decimal updatedWalletBalance = 0;

        //    if (orderModel.Pair == "BTCUSDT")
        //    {
        //        //Buy - USDT
        //        if (orderModel.IsBuy)
        //        {
        //            var wallet = await _walletsRepository.GetUserWalletAsync(userId, "USDT");

        //            if (wallet == null)
        //            {
        //                return BadRequest("You dont have a wallets. Create them");
        //            }

        //            if (wallet.Value < total)
        //            {
        //                return BadRequest("You dont have wallet balance.");
        //            }

        //            var updatedWallet = wallet;

        //            updatedWallet.Value -= total;

        //            updatedWalletBalance = updatedWallet.Value;

        //            await _walletsRepository.UpdateWalletBalanceAsync(updatedWallet);
        //        }
        //        else //Sell - BTC
        //        {
        //            var wallet = await _walletsRepository.GetUserWalletAsync(userId, "BTC");

        //            if (wallet == null)
        //            {
        //                return BadRequest("You dont have a wallets. Create them");
        //            }

        //            if (wallet.Value < amountDecimal)
        //            {
        //                return BadRequest("You dont have wallet balance.");
        //            }

        //            var updatedWallet = wallet;

        //            updatedWallet.Value -= amountDecimal;

        //            updatedWalletBalance = updatedWallet.Value;

        //            await _walletsRepository.UpdateWalletBalanceAsync(updatedWallet);
        //        }

        //        OpenOrderTableModel order = new OpenOrderTableModel
        //        {
        //            Price = priceDecimal,
        //            Amount = amountDecimal,
        //            Total = total,
        //            CreateUserId = userId,
        //            CreateDate = DateTime.Now,
        //        };

        //        var result = await _tradeRepository.spProcess_BTC_USDT_Order(order, orderModel.IsBuy);

        //        while (result.Amount != order.Amount && result.Amount != 0)
        //        {
        //            order.Amount = result.Amount;

        //            result = await _tradeRepository.spProcess_BTC_USDT_Order(order, orderModel.IsBuy);

        //            if (result.ClosedOrderUserId != "-1")
        //            {
        //                await _hubcontext.Clients.User(result.ClosedOrderUserId).SendAsync("OrderWasClosed",
        //                    JsonConvert.SerializeObject(result.ClosedOrderId));
        //            }
        //        }

        //        order.Id = result.Id;

        //        if (result.Id == -1)
        //        {
        //            await _hubcontext.Clients.User(userId).SendAsync("OrderWasClosed", result.Id);
        //        }
        //        else
        //        {
        //            await _hubcontext.Clients.User(userId)
        //                .SendAsync("OrderWasCreated", JsonConvert.SerializeObject(order));
        //        }
        //    }

        //    return Ok(updatedWalletBalance.ToString());
        //}

        [HttpPost]
        [Route("trade/crypto/createorder")]
        public async Task<ActionResult> CryptoCreateOrder([FromBody] OrderModel orderModel)
        {
            if (orderModel == null) return BadRequest("orderModel is null.");

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

            decimal updatedWalletBalance = 0;

            var pair = await _pairsRepository.GetPairByAcronimAsync(orderModel.Pair);

            if (pair == null) return BadRequest("Wrong pair.");

            string firstCurrency = pair.Currency1;
            string secondCurrency = pair.Currency2;

            if (orderModel.IsBuy)
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, secondCurrency);

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
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, firstCurrency);

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

            OpenOrderTableModel order = new OpenOrderTableModel
            {
                Price = priceDecimal,
                Amount = amountDecimal,
                Total = total,
                CreateUserId = userId,
                CreateDate = DateTime.Now,
                CryptExchangePair = pair.SQLTableName
            };

            var result = await _tradeRepository.ProcessOrder(order, orderModel.IsBuy);

            while (result.Amount != order.Amount && result.Amount != 0)
            {
                order.Amount = result.Amount;

                result = await _tradeRepository.ProcessOrder(order, orderModel.IsBuy);

                if (result.ClosedOrderUserId != "-1")
                {
                    await _hubcontext.Clients.User(result.ClosedOrderUserId).SendAsync("OrderWasClosed",
                        JsonConvert.SerializeObject(result.ClosedOrderId));
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

        //public async Task<ActionResult> BTCUSDT()
        //{
        //    List<WalletTableModel> userWallets = new List<WalletTableModel>();

        //    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        //    BTC_USDTViewModel model = new BTC_USDTViewModel();

        //    if (!string.IsNullOrEmpty(userId))
        //    {
        //        model.UserId = userId;

        //        userWallets = await _walletsRepository.GetUserWalletsAsync(userId);

        //        model.UserWallets = userWallets;

        //        WalletTableModel btcWallet = userWallets.FirstOrDefault(x => x.CurrencyAcronim == "BTC");

        //        if (btcWallet == null)
        //        {
        //            var newbtcWallet = new WalletTableModel
        //            {
        //                UserId = userId,
        //                CurrencyAcronim = "BTC",
        //                Address = System.Guid.NewGuid().ToString().Replace("-", ""),
        //                Value = 0
        //            };

        //            btcWallet = await _walletsRepository.CreateUserWalletAsync(newbtcWallet);
        //        }

        //        model.UserWallets.Add(btcWallet);

        //        model.BtcWallet = btcWallet;

        //        WalletTableModel usdtWallet = userWallets.FirstOrDefault(x => x.CurrencyAcronim == "USDT");

        //        if (usdtWallet == null)
        //        {
        //            usdtWallet = new WalletTableModel
        //            {
        //                UserId = userId,
        //                CurrencyAcronim = "USDT",
        //                Address = System.Guid.NewGuid().ToString().Replace("-", ""),
        //                Value = 0
        //            };

        //            usdtWallet = await _walletsRepository.CreateUserWalletAsync(usdtWallet);
        //        }

        //        model.UserWallets.Add(usdtWallet);

        //        model.UsdtWallet = usdtWallet;

        //        model.UserOpenOrders =
        //            await _tradeRepository.spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(userId);
        //    }

        //    model.BuyOrderBook = await _tradeRepository.Get_BTC_USDT_BuyOrderBookAsync();
        //    model.SellOrderBook = await _tradeRepository.Get_BTC_USDT_SellOrderBookAsync();
        //    model.MarketTrades = await _tradeRepository.spGet_BTC_USDT_ClosedOrders_Top100();

        //    return View(model);
        //}

        //public async Task<ActionResult> BTCUSDTVue()
        //{
        //    BTC_USDTViewModel model = new BTC_USDTViewModel();

        //    return View(model);
        //}

        [Route("trade/crypto/{acronim}")]
        public async Task<ActionResult> Crypto(string acronim)
        {
            var pair = await _pairsRepository.GetPairByAcronimAsync(acronim.ToUpper());

            CryptoModel model = new CryptoModel();

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                model.UserId = userId;

                var userWallets = await _walletsRepository.GetUserWalletsAsync(userId);
                model.UserWallets = userWallets;

                WalletTableModel firstWallet =
                    userWallets.FirstOrDefault(x => x.CurrencyAcronim == pair.Currency1.ToUpper());

                if (firstWallet == null)
                {
                    var newWallet = new WalletTableModel
                    {
                        UserId = userId,
                        CurrencyAcronim = pair.Currency1.ToUpper(),
                        Address = System.Guid.NewGuid().ToString().Replace("-", ""),
                        Value = 0
                    };

                    firstWallet = await _walletsRepository.CreateUserWalletAsync(newWallet);

                    model.UserWallets.Add(firstWallet);
                }

                model.FirstWallet = firstWallet;

                WalletTableModel secondWallet =
                    userWallets.FirstOrDefault(x => x.CurrencyAcronim == pair.Currency2.ToUpper());

                if (secondWallet == null)
                {
                    var newWallet = new WalletTableModel
                    {
                        UserId = userId,
                        CurrencyAcronim = pair.Currency2.ToUpper(),
                        Address = System.Guid.NewGuid().ToString().Replace("-", ""),
                        Value = 0
                    };

                    secondWallet = await _walletsRepository.CreateUserWalletAsync(newWallet);

                    model.UserWallets.Add(secondWallet);
                }

                model.SecondWallet = secondWallet;

                model.UserOpenOrders =
                    await _tradeRepository.GetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate(userId, pair.SQLTableName);
            }

            model.FirstCurrency = pair.Currency1.ToUpper();
            model.SecondCurrency = pair.Currency2.ToUpper();

            model.PairHeader = model.FirstCurrency + " - " + model.SecondCurrency;
            model.Pair = model.FirstCurrency + model.SecondCurrency;

            model.BuyOrderBook = await _tradeRepository.GetBuyOrderBookAsync(pair.SQLTableName);
            model.SellOrderBook =
                await _tradeRepository.GetSellOrderBookAsync(pair.SQLTableName);
            model.MarketTrades =
                await _tradeRepository.GetClosedOrders_Top100(pair.SQLTableName);

            return View(model);
        }

        public class CryptoModel
        {
            public string UserId { get; set; }
            public List<WalletTableModel> UserWallets { get; set; }
            public WalletTableModel FirstWallet { get; set; }
            public WalletTableModel SecondWallet { get; set; }
            public List<ClosedOrderTableModel> MarketTrades { get; set; }
            public List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate> UserOpenOrders { get; set; }
            public List<spGetOrderByDescPriceOrderBookResult> BuyOrderBook { get; set; }
            public List<spGetOrderByDescPriceOrderBookResult> SellOrderBook { get; set; }
            public List<CandleStickTableModel> CandleStick { get; set; }
            public string Pair { get; set; }
            public string PairHeader { get; set; }
            public string FirstCurrency { get; set; }
            public string SecondCurrency { get; set; }
        }
    }
}