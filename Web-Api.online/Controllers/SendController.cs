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

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class SendController : Controller
    {
        private WalletsRepository _walletsRepository;
        private ILitecoinService _litecoinService;
        private EventsRepository _eventsRepository;

        public LTCModel Model { get; set; }
        private decimal amountMin = 0.0000001M;

        public class LTCModel
        {
            public string Status { get; set; }
            public decimal AmountMin { get; set; }
            public decimal Commission { get; set; }

            [Required]
            public string Currency { get; set; }
            [Required]
            public string UserId { get; set; }
            [Required]
            public string Amount { get; set; }
        }

        public SendController(WalletsRepository walletsRepository,
            ILitecoinService litecoinService,
            EventsRepository eventsRepository)
        {
            Model = new LTCModel();
            _walletsRepository = walletsRepository;
            _litecoinService = litecoinService;
            _eventsRepository = eventsRepository;
        }

        [HttpGet]
        public async Task<IActionResult> IndexAsync()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var wallets = await _walletsRepository.GetUserWalletsAsync(userId);
            return View(wallets);
        }

        [HttpGet]
        public IActionResult LTC()
        {
            Model.Currency = "LTC";
            Model.AmountMin = amountMin;
            Model.Commission = 0;
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
                    var walletFrom = await _walletsRepository.GetUserWalletAsync(userId, "LTC");
                    var walletTo = await _walletsRepository.GetUserWalletAsync(indexModel.UserId, "LTC");

                    decimal? _amount = indexModel.Amount.ConvertToDecimal();
                    if(walletFrom !=null && walletTo!=null)
                    {
                        if (_amount.Value > 0 && _amount.Value <= walletFrom.Value &&
                        amountMin < _amount.Value)
                        {
                            walletFrom.Value -= _amount.Value;
                            walletTo.Value += _amount.Value;

                            SendCoinsModel sendRecieve = new()
                            {
                                EventSender = new Events()
                                {
                                    UserId = userId,
                                    Type = (int)EventType.Send,
                                    Comment = "Send success",
                                    Value = _amount.Value,
                                    WhenDate = DateTime.Now,
                                    CurrencyAcronim = "LTC"
                                },
                                EventReceiver = new Events()
                                {
                                    UserId = indexModel.UserId,
                                    Type = (int)EventType.Recieve,
                                    Comment = "Recieve success",
                                    Value = _amount.Value,
                                    WhenDate = DateTime.Now,
                                    CurrencyAcronim = "LTC"
                                },
                                WalletSender = walletFrom,
                                WalletReceiver = walletTo,
                            };

                            await _walletsRepository.SendCoinsAync(sendRecieve);
                            indexModel.Status = "Success";
                        }
                        else
                        {
                            indexModel.Status = "Not enough coins";
                        }
                    }
                    else
                    {
                        indexModel.Status = "Error invalid address";
                    }
                }
                catch
                {
                    indexModel.Status = "Error";
                    return View(indexModel);
                }

            }
            return View(nameof(LTC), indexModel);
        }

    }
}
