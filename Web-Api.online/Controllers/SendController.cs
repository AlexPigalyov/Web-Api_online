using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using System.Threading.Tasks;

using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Extensions;
using Web_Api.online.Hash;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;
using Web_Api.online.Services;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class SendController : Controller
    {
        private WalletsRepository _walletsRepository;
        private ILitecoinService _litecoinService;
        private EventsRepository _eventsRepository;
        private UserManager<IdentityUser> _userManager;
        private UserRepository _userRepository;
        private WalletService _walletService;
        private BalanceProvider _balanceProvider;

        public SendController(WalletsRepository walletsRepository,
            ILitecoinService litecoinService,
            EventsRepository eventsRepository,
            UserManager<IdentityUser> userManager,
            UserRepository userRepository,
            WalletService walletService, 
            BalanceProvider balanceProvider)
        {
            _walletsRepository = walletsRepository;
            _litecoinService = litecoinService;
            _eventsRepository = eventsRepository;
            _userManager = userManager;
            _userRepository = userRepository;
            _walletService = walletService;
            _balanceProvider = balanceProvider;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var wallets = await _walletsRepository.GetUserWalletsAsync(userId);
            return View(wallets);
        }

        [HttpGet]
        public async Task<IActionResult> Coins(string currency)
        {
            var cur = await _walletsRepository.GetCurrencyByAcronimAsync(currency);
            if (cur != null)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                SendCoinsViewModel model = new();
                model.Currency = currency;
                model.Balance = (await _walletsRepository.GetUserWalletAsync(userId, currency)).Value;
                model.Commission = 0;
                return View(model);
            }
            return NotFound();
        }

        [HttpPost]
        public async Task<IActionResult> Coins(SendCoinsViewModel sendCoinsModel)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

                    string sendToUserId = await _userRepository.FindUserIdForSendPageAsync(sendCoinsModel.InputTextIdentifier);

                    if (string.IsNullOrEmpty(sendToUserId))
                    {
                        sendCoinsModel.Status = "Error. User does not exist.";
                        return View(sendCoinsModel);
                    }

                    var walletFrom = await _walletsRepository.GetUserWalletAsync(userId, sendCoinsModel.Currency);
                    var walletTo = await _walletsRepository.GetUserWalletAsync(sendToUserId, sendCoinsModel.Currency);


                    decimal? _amount = sendCoinsModel.Amount.ConvertToDecimal();

                    if (walletFrom != null &&
                        _amount.Value > 0 &&
                        _amount.Value <= walletFrom.Value)
                    {
                        if (walletTo == null)
                        {
                            walletTo = await _walletsRepository.CreateUserWalletAsync(new WalletTableModel()
                            {
                                UserId = sendToUserId,
                                CurrencyAcronim = walletFrom.CurrencyAcronim,
                                Value = 0,
                                Address = _walletService.GetNewAddress(walletFrom.CurrencyAcronim, sendToUserId)
                            });

                            await _eventsRepository.CreateEventAsync(new EventTableModel()
                            {
                                UserId = userId,
                                Type = (int)EventTypeEnum.CreateWallet,
                                Comment = $"Create wallet {walletTo.CurrencyAcronim}",
                                WhenDate = DateTime.Now,
                                CurrencyAcronim = walletTo.CurrencyAcronim
                            });
                        }

                        var resultBalance = await _balanceProvider.Send(_amount.Value, walletFrom, walletTo);

                        SendCoinsModel sendRecieve = new()
                        {
                            SenderUserId = userId,
                            ReceiverUserId = sendToUserId,
                            TypeSender = (int)EventTypeEnum.Send,
                            TypeRecieve = (int)EventTypeEnum.Recieve,
                            Comment = sendCoinsModel.Comment,
                            CurrencyAcronim = sendCoinsModel.Currency,
                            Value = _amount.Value,
                            PlatformCommission = resultBalance.Commission,
                            StartBalanceSender = resultBalance.StartBalanceSender,
                            ResultBalanceSender = resultBalance.ResultBalanceSender,
                            StartBalanceReceiver = resultBalance.StartBalanceReceiver.Value,
                            ResultBalanceReceiver = resultBalance.ResultBalanceReceiver.Value,
                            SenderWalletId = walletFrom.Id,
                            ReceiverWalletId= walletTo.Id,
                        };

                        sendRecieve.Hash = GenerateHash.ComputeHash(sendCoinsModel.Currency, sendRecieve.SenderWalletId,
                            sendRecieve.ReceiverWalletId, sendRecieve.Value, DateTime.Now, sendRecieve.Comment);


                        await _walletsRepository.SendCoinsAsync(sendRecieve);
                        sendCoinsModel.Status = "Success";
                    }
                    else
                    {
                        sendCoinsModel.Status = "Not enough coins";
                    }
                }
                catch
                {
                    sendCoinsModel.Status = "Error";
                    return View(sendCoinsModel);
                }
            }
            return View(sendCoinsModel);
        }
    }
}
