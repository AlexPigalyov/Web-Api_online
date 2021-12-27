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
using Web_Api.online.Clients;
using System.Net;
using System.IO;
using Web_Api.online.Hash;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class WalletsController : Controller
    {
        private WalletsRepository _walletsRepository;
        private ICoinManager _coinManager;
        private TransactionManager _transactionManager;
        private EventsRepository _eventsRepository;
        private OutcomeTransactionRepository _outcomeTransactionRepository;
        private ZCashService _zecService;
        private EtheriumService _etheriumService;
        private WalletService _walletService;

        public WalletsController(WalletsRepository walletsRepository,
            ICoinManager coinManager,
            TransactionManager transactionManager,
            EventsRepository eventsRepository,
            OutcomeTransactionRepository outcomeTransactionRepository,
            ZCashService zecService,
            EtheriumService etheriumService, 
            WalletService walletService)
        {
            _walletsRepository = walletsRepository;
            _coinManager = coinManager;
            _transactionManager = transactionManager;
            _eventsRepository = eventsRepository;
            _outcomeTransactionRepository = outcomeTransactionRepository;
            _zecService = zecService;
            _etheriumService = etheriumService;
            _walletService = walletService;
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
                model.UserWallets = await _transactionManager.GetUpdatedWalletsAsync(userId);
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
                // create new income blockchain address(incomeWallet)
                string address = _walletService.GetNewAddress(selectCurrency, userId);

                if (address == null)
                {
                    return RedirectToAction("Index");
                }

                await _eventsRepository.CreateEventAsync(new EventTableModel()
                {
                    UserId = userId,
                    Type = (int)EventTypeEnum.CreateAddress,
                    Comment = $"Create address {selectCurrency}: {address}",
                    WhenDate = DateTime.Now,
                    CurrencyAcronim = selectCurrency
                });

                IncomeWalletTableModel incomeWallet = new IncomeWalletTableModel()
                {
                    UserId = userId,
                    CurrencyAcronim = selectCurrency,
                    Address = address,
                    AddressLabel = userId
                };

                var wallet = await _walletsRepository.GetUserWalletAsync(userId, selectCurrency);

                // create new inner platform wallet
                if(wallet == null)
                {
                    wallet = await _walletsRepository.CreateUserWalletAsync(new WalletTableModel()
                    {
                        UserId = userId,
                        CurrencyAcronim = selectCurrency,
                        Value = 0,
                        Address = _walletService.GetNewAddress(selectCurrency, userId)
                    });

                    await _eventsRepository.CreateEventAsync(new EventTableModel()
                    {
                        UserId = wallet.UserId,
                        Type = (int)EventTypeEnum.CreateWallet,
                        Comment = $"Create wallet {wallet.CurrencyAcronim}",
                        WhenDate = DateTime.Now,
                        CurrencyAcronim = wallet.CurrencyAcronim
                    });
                }

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
