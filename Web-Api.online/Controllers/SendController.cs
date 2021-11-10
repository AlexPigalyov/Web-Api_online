using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
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
            UserRepository userRepository)
        {
            Model = new CoinsModel();
            _walletsRepository = walletsRepository;
            _litecoinService = litecoinService;
            _eventsRepository = eventsRepository;
            _userManager = userManager;
            _userRepository = userRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var wallets = await _walletsRepository.GetUserWalletsAsync(userId);
            return View(wallets);
        }

        [HttpGet]
        public IActionResult Coins(string currency)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            Model.Currency = currency;
            Model.AmountMin = amountMin;
            Model.Balance = _walletsRepository.GetUserWalletAsync(userId, currency).Result.Value;
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

                    string sendToUserId = _userRepository.FindUserIdForSendPageAsync(coinsModel.InputTextIdentifier).Result;

                    if (string.IsNullOrEmpty(sendToUserId))
                    {
                        coinsModel.Status = "Error invalid address";
                        return View(coinsModel);
                    }

                    //if (input.IsEmail())
                    //{
                    //    userToSend = await _userManager.FindByNameAsync(input);
                    //}
                    //else if (input.IsPhoneNumber())
                    //{
                    //    coinsModel.Status = "not implementation";
                    //    return View(coinsModel);
                    //}
                    //else if (input.IsWalletId())
                    //{
                    //    coinsModel.Status = "not implementation";
                    //    return View(coinsModel);
                    //}
                    //else if (input.IsName())
                    //{
                    //    coinsModel.Status = "not implementation";
                    //    return View(coinsModel);
                    //}
                    //else
                    //{
                    //    coinsModel.Status = "Input exception";
                    //    return View(coinsModel);
                    //}

                    var walletFrom = await _walletsRepository.GetUserWalletAsync(userId, coinsModel.Currency);
                    var walletTo = await _walletsRepository.GetUserWalletAsync(sendToUserId, coinsModel.Currency);

                    decimal? _amount = coinsModel.Amount.ConvertToDecimal();

                    if (walletFrom != null && walletTo != null)
                    {
                        if (_amount.Value > 0 && _amount.Value <= walletFrom.Value &&
                        amountMin < _amount.Value)
                        {
                            TransferTableModel transfer = new()
                            {
                                WalletFromId = walletFrom.Id,
                                WalletToId = walletTo.Id,
                                Value = _amount.Value,
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

                            await _walletsRepository.SendCoinsAync(sendRecieve);
                            coinsModel.Status = "Success";
                        }
                        else
                        {
                            coinsModel.Status = "Not enough coins";
                        }
                    }
                    else
                    {
                        coinsModel.Status = "Error invalid address";
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
