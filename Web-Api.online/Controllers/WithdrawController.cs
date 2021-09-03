using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Extensions;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.WithdrawModels;
using Web_Api.online.Repositories;
using Web_Api.online.Repositories.Abstract;
using Web_Api.online.Services;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class WithdrawController : Controller
    {
        private WalletsRepository _walletsRepository;
        private WithdrawService _withdrawService;

        public WithdrawController(WalletsRepository walletsRepository,
            WithdrawService withdrawService)
        {
            _walletsRepository = walletsRepository;
            _withdrawService = withdrawService;
        }

        [HttpGet]
        public async Task<IActionResult> Index(string currency)
        {
            var currencies = await _walletsRepository.GetCurrenciesAsync();
            var _currency = currencies.FirstOrDefault(x => x.Acronim == currency);

            if (_currency != null)
            {
                return View("GeneralWithdrawPage", new GeneralWithdrawModel(_currency.Name));
            }

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var wallets = await _walletsRepository.GetUserWalletsAsync(userId);
            return View(wallets);
        }

        [HttpPost]
        public async Task<IActionResult> Index(GeneralWithdrawModel model)
        {
            if (ModelState.IsValid)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var m = await _withdrawService.Send(model, userId);
                return View(m.Currency, m);
            }
            return View(model.Currency, model);
        }
    }
}
