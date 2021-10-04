using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using System.Security.Claims;
using Web_Api.online.Services.Interfaces;
using Web_Api.online.Services;
using Web_Api.online.Models.Enums;
using Microsoft.AspNetCore.Authorization;
using Web_Api.online.Data.Repositories;
using Nethereum.Web3;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class WalletsController : Controller
    {
        private WalletsRepository _walletsRepository;
        private ICoinManager _coinManager;
        private TransactionManager _transactionManager;
        private EventsRepository _eventsRepository;
        private Web3 _web3;

        public WalletsController(WalletsRepository walletsRepository,
            ICoinManager coinManager,
            TransactionManager transactionManager,
            EventsRepository eventsRepository,
            Web3 web3)
        {
            _walletsRepository = walletsRepository;
            _coinManager = coinManager;
            _transactionManager = transactionManager;
            _eventsRepository = eventsRepository;
            _web3 = web3;
        }

        public class IndexModel
        {
            public List<CurrencyTableModel> Currencies { get; set; }
            public List<IncomeWalletTableModel> UserIncomeWallets { get; set; }
            public List<WalletTableModel> UserWallets { get; set; }
        }

        // GET: WalletsController
        public async Task<ActionResult> Index()
        {
            List<CurrencyTableModel> currencies = await _walletsRepository.GetCurrenciesAsync();

            IndexModel model = new IndexModel();
            model.Currencies = currencies;
            model.UserWallets = new List<WalletTableModel>();
            model.UserIncomeWallets = new List<IncomeWalletTableModel>();

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                model.UserWallets = await _transactionManager.GetUpdatedWallets(userId);
                model.UserIncomeWallets = await _walletsRepository.GetUserIncomeWalletsAsync(userId);
            }

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(string selectCurrency)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!string.IsNullOrEmpty(userId))
            {
                string address = "";

                if (selectCurrency == "ETH")
                {
                    address = await _web3.Personal.NewAccount.SendRequestAsync(userId);
                }
                else
                {
                    foreach (var coin in _coinManager.CoinServices)
                    {
                        if (coin.CoinShortName == selectCurrency)
                        {
                            address = coin.GetNewAddress(userId);
                            break;
                        }
                    }
                }
                if (address == "")
                {
                    return RedirectToAction("Index");
                }

                await _eventsRepository.CreateEvent(new EventTableModel()
                {
                    UserId = userId,
                    Type = (int)EventTypeEnum.CreateAddress,
                    Comment = $"Create address {selectCurrency}",
                    WhenDate = DateTime.Now,
                    CurrencyAcronim = selectCurrency
                });

                IncomeWalletTableModel incomeWallet = new IncomeWalletTableModel()
                {
                    UserId = userId,
                    CurrencyAcronim = selectCurrency,
                    Address = address,
                    AddressLabel = userId //придумать что-нибудь
                };

                await _walletsRepository.CreateUserIncomeWalletAsync(incomeWallet);
                return RedirectToAction("Index");
            }
            else
            {
                return Redirect("/Identity/Account/Login");
            }
        }
    }
}
