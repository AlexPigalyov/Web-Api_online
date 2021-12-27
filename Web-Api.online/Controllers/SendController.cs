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
using Web_Api.online.Services;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class SendController : Controller
    {
        private WalletsRepository walletsRepository;
        private ILitecoinService litecoinService;
        private EventsRepository eventsRepository;
        private UserManager<IdentityUser> userManager;
        private UserRepository userRepository;
        private WalletService walletService;

        public CoinsModel Model { get; set; }
        private decimal amountMin = 0.0000001M;

        public class CoinsModel
        {
            public string Status { get; set; }
            public decimal AmountMin { get; set; }
            public decimal Commission { get; set; }


            [Required]
            public string InputTextIdentifier { get; set; }
            [Required]
            public string Currency { get; set; }
            public decimal Balance { get; set; }
            [Required]
            public string Amount { get; set; }
            public string Comment { get; set; }
        }

        public SendController(WalletsRepository walletsRepository,
            ILitecoinService litecoinService,
            EventsRepository eventsRepository,
            UserManager<IdentityUser> userManager,
            UserRepository userRepository,
            WalletService walletService)
        {
            Model = new CoinsModel();
            this.walletsRepository = walletsRepository;
            this.litecoinService = litecoinService;
            this.eventsRepository = eventsRepository;
            this.userManager = userManager;
            this.userRepository = userRepository;
            this.walletService = walletService;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var wallets = await walletsRepository.GetUserWalletsAsync(userId);
            return View(wallets);
        }

        [HttpGet]
        public IActionResult Coins(string currency)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            Model.Currency = currency;
            Model.AmountMin = amountMin;
            Model.Balance = walletsRepository.GetUserWalletAsync(userId, currency).Result.Value;
            Model.Commission = 0;
            return View(Model);
        }

        [HttpPost]
        public async Task<IActionResult> Coins(CoinsModel coinsModel)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

                    string sendToUserId = await userRepository.FindUserIdForSendPageAsync(coinsModel.InputTextIdentifier);

                    if (string.IsNullOrEmpty(sendToUserId))
                    {
                        coinsModel.Status = "Error. User does not exist.";
                        return View(coinsModel);
                    }

                    var walletFrom = await walletsRepository.GetUserWalletAsync(userId, coinsModel.Currency);
                    var walletTo = await walletsRepository.GetUserWalletAsync(sendToUserId, coinsModel.Currency);


                    decimal? _amount = coinsModel.Amount.ConvertToDecimal();

                    if (walletFrom != null &&
                        _amount.Value > 0 &&
                        _amount.Value <= walletFrom.Value &&
                        amountMin < _amount.Value)
                    {
                        if (walletTo == null)
                        {
                            walletTo = await walletsRepository.CreateUserWalletAsync(new WalletTableModel()
                            {
                                UserId = sendToUserId,
                                CurrencyAcronim = walletFrom.CurrencyAcronim,
                                Value = 0,
                                Address = walletService.GetNewAddress(walletFrom.CurrencyAcronim, sendToUserId)
                            });

                            await eventsRepository.CreateEventAsync(new EventTableModel()
                            {
                                UserId = userId,
                                Type = (int)EventTypeEnum.CreateWallet,
                                Comment = $"Create wallet {walletTo.CurrencyAcronim}",
                                WhenDate = DateTime.Now,
                                CurrencyAcronim = walletTo.CurrencyAcronim
                            });
                        }

                        TransferTableModel transfer = new()
                        {
                            WalletFromId = walletFrom.Id,
                            WalletToId = walletTo.Id,
                            Value = 0,
                            CurrencyAcronim = coinsModel.Currency,
                            Comment = coinsModel.Comment
                        };
                        GenerateHash.ComputeHash(transfer);

                        SendCoinsModel sendRecieve = new()
                        {
                            EventSender = new EventTableModel()
                            {
                                UserId = userId,
                                Type = (int)EventTypeEnum.Send,
                                Comment = coinsModel.Comment,
                                Value = _amount.Value,
                                CurrencyAcronim = coinsModel.Currency,
                            },
                            EventReceiver = new EventTableModel()
                            {
                                UserId = sendToUserId,
                                Type = (int)EventTypeEnum.Recieve,
                                Comment = coinsModel.Comment,
                                Value = _amount.Value,
                                CurrencyAcronim = coinsModel.Currency,
                            },
                            Transfer = transfer
                        };

                        await walletsRepository.SendCoinsAsync(sendRecieve);
                        coinsModel.Status = "Success";
                    }
                    else
                    {
                        coinsModel.Status = "Not enough coins";
                    }

                }
                catch
                {
                    coinsModel.Status = "Error";
                    return View(coinsModel);
                }

            }
            return View(coinsModel);
        }

    }
}
