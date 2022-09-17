using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Services;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class WalletsController : Controller
    {
        private WalletsRepository _walletsRepository;
        private TransactionManager _transactionManager;
        private IEventsRepository _eventsRepository;
        private WalletService _walletService;

        public WalletsController(WalletsRepository walletsRepository,
            TransactionManager transactionManager,
            IEventsRepository eventsRepository,
            WalletService walletService)
        {
            _walletsRepository = walletsRepository;
            _transactionManager = transactionManager;
            _eventsRepository = eventsRepository;
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
                if (wallet == null)
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
                return Redirect("/Login");
            }
        }
    }
}
