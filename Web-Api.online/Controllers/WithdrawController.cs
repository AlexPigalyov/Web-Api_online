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
using Web_Api.online.Repositories;
using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class WithdrawController : Controller
    {
        private WalletsRepository _walletsRepository;
        private ILitecoinService _litecoinService;
        private EventsRepository _eventsRepository;

        public LTCModel Model { get; set; }

        public class LTCModel
        {
            public string Status { get; set; }
            public decimal AmountMin { get; set; }
            public decimal Commission { get; set; }

            [Required]
            public string Currency { get; set; }
            [Required]
            public string Address { get; set; }
            [Required]
            public string Amount { get; set; }
        }

        public WithdrawController(WalletsRepository walletsRepository,
            ILitecoinService litecoinService,
            EventsRepository eventsRepository)
        {
            Model = new LTCModel();
            _walletsRepository = walletsRepository;
            _litecoinService = litecoinService;
            _eventsRepository = eventsRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var wallets = await _walletsRepository.GetUserWalletsAsync(userId);
            return View(wallets);
        }

        [HttpGet]
        public IActionResult LTC()
        {
            Model.Currency = "LTC";
            Model.AmountMin = 777;
            Model.Commission = 777;
            return View(Model);
        }

        [HttpPost]
        public async Task<IActionResult> LTC(LTCModel indexModel)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                    var wallet = await _walletsRepository.GetUserWalletAsync(userId, "LTC");
                    decimal? _amount = indexModel.Amount.ConvertToDecimal();
                    if (_amount.Value > 0 && _amount.Value <= wallet.Value)
                    {
                        _litecoinService.SendToAddress(indexModel.Address, _amount.Value, "", "", true);
                        wallet.Value -= _amount.Value;

                        await _eventsRepository.AddEvent(new Events()
                        {
                            UserId = userId,
                            Type = (int)EventType.Withdraw,
                            Comment = "Success",
                            Value = _amount.Value,
                            WhenDate = DateTime.Now,
                            CurrencyAcronim = "LTC"
                        });
                        indexModel.Status = "Success";
                        await _walletsRepository.UpdateWalletBalance(wallet);
                    }
                    else
                    {
                        indexModel.Status = "Недостаточно монет";
                    }
                }
                catch
                {
                    indexModel.Status = "error";
                    return View(indexModel);
                }

            }
            return View(nameof(LTC), indexModel);
        }
    }
}
