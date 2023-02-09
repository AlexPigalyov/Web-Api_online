using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
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
}