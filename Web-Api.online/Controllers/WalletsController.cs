using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories;
using System.Security.Claims;
using Web_Api.online.Services.Interfaces;
using Web_Api.online.Services;

namespace Web_Api.online.Controllers
{
    public class WalletsController : Controller
    {
        private WalletsRepository _walletsRepository;
        private ICoinManager _coinManager;
        private TransactionManager _transactionManager;

        public WalletsController(WalletsRepository walletsRepository,
            ICoinManager coinManager,
            TransactionManager transactionManager)
        {
            _walletsRepository = walletsRepository;
            _coinManager = coinManager;
            _transactionManager = transactionManager;
        }

        public class IndexModel
        {
            public List<Currency> Currencies { get; set; }
            public List<IncomeWallet> UserIncomeWallets { get; set; }
            public List<Wallet> UserWallets { get; set; }
        }

        // GET: WalletsController
        public async Task<ActionResult> Index()
        {
            List<Currency> currencies = await _walletsRepository.GetCurrenciesAsync();

            List<IncomeWallet> userIncomeWallets = new List<IncomeWallet>();
            List<Wallet> userWallets = new List<Wallet>();

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                await _transactionManager.StartSearch(userId);
                userIncomeWallets = await _walletsRepository.GetUserIncomeWalletsAsync(userId);
                userWallets = await _walletsRepository.GetUserWalletsAsync(userId);
            }

            IndexModel model = new IndexModel();

            model.Currencies = currencies;
            model.UserIncomeWallets = userIncomeWallets;
            model.UserWallets = userWallets;

            return View(model);
        }

        public ActionResult Details(string name)
        {
            return View();
        }

        // POST: WalletsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(string selectCurrency)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!string.IsNullOrEmpty(userId))
            {
                string address = "";

                foreach (var coin in _coinManager.CoinServices)
                {
                    if (coin.CoinShortName.ToLower() == selectCurrency.ToLower())
                    {
                        address = coin.GetNewAddress(userId);
                        break;
                    }
                }

                IncomeWallet incomeWallet = new IncomeWallet()
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

        // GET: WalletsController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: WalletsController/Edit/5
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

        // GET: WalletsController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: WalletsController/Delete/5
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
