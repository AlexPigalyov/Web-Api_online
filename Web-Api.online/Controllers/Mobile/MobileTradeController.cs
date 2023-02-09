using System;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Mappers;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Controllers.Mobile;

[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[Route("[controller]/[action]")]
public class MobileTradeController : Controller
{
    private readonly WalletsRepository _walletsRepository;
    private readonly TradeRepository _tradeRepository;
    private readonly IHubContext<Hub> _hubcontext;
    private readonly BotsRepository _botsRepository;
    private readonly CandleStickRepository _candleStickRepository;
    private readonly IEventsRepository _eventsRepository;
    private readonly PairsRepository _pairsRepository;

    public MobileTradeController(
        PairsRepository pairsRepository, TradeRepository tradeRepository, WalletsRepository walletsRepository,
        IHubContext<Hub> hubcontext, BotsRepository botsRepository, CandleStickRepository candleStickRepository,
        IEventsRepository eventsRepository)
    {
        _pairsRepository = pairsRepository;
        _tradeRepository = tradeRepository;
        _walletsRepository = walletsRepository;
        _hubcontext = hubcontext;
        _botsRepository = botsRepository;
        _candleStickRepository = candleStickRepository;
        _eventsRepository = eventsRepository;
    }

    // GET: TradeController
    public async Task<ActionResult> Index()
    {
        var model = await _pairsRepository.GetAllPairsAsync();

        return Ok(model);
    }

    public async Task<ActionResult> Crypto(string acronim)
    {
        var pair = await _pairsRepository.GetPairByAcronimAsync(acronim.ToUpper());

        TradeController.CryptoModel model = new TradeController.CryptoModel();

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

        return Ok(model);
    }

    [HttpPost]
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
}