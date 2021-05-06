using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Repositories;
using Web_Api.online.Models;
using System.Security.Claims;

namespace Web_Api.online.Controllers
{
    public class TradeController : Controller
    {
        private WalletsRepository _walletsRepository;

        public TradeController(WalletsRepository walletsRepository)
        {
            _walletsRepository = walletsRepository;
        }

        // GET: TradeController
        public ActionResult Index()
        {
            return View();
        }

        public class BTC_USDTModel
        {
            public List<Wallet> UserWallets { get; set; }
        }

        public async Task<ActionResult> BTC_USDT()
        {
            List<Wallet> userWallets = new List<Wallet>();

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!string.IsNullOrEmpty(userId))
            {
                userWallets = await _walletsRepository.GetUserWalletsAsync(userId);
            }

            BTC_USDTModel model = new BTC_USDTModel();

            model.UserWallets = userWallets;

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

        // POST: TradeController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
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
