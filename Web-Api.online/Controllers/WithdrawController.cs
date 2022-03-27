using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Web_Api.online.Clients;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.WithdrawModels;
using Web_Api.online.Services;

namespace Web_Api.online.Controllers
{
    [Authorize]
    public class WithdrawController : Controller
    {
        private WalletsRepository _walletsRepository;
        private WithdrawService _withdrawService;
        private ZCashService _zecService;
        private EtheriumService _etheriumService;

        public WithdrawController(WalletsRepository walletsRepository,
            WithdrawService withdrawService, ZCashService zecService,
            EtheriumService etheriumService)
        {
            _walletsRepository = walletsRepository;
            _withdrawService = withdrawService;
            _zecService = zecService;
            _etheriumService = etheriumService;
        }

        [HttpGet]
        public async Task<IActionResult> Index(string currency)
        {
            var _currency = await _walletsRepository.GetCurrencyByAcronimAsync(currency);

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
            GeneralWithdrawModel m = new();

            if (ModelState.IsValid)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

                if(model.Currency == "ZEC")
                {
                    m = await _zecService.SendToAddress(model, userId);
                }
                else if(model.Currency == "ETH")
                {
                    m = await _etheriumService.SendToAddress(model, userId);
                }
                else
                {
                    m = await _withdrawService.Send(model, userId);
                }

                
                return View("GeneralWithdrawPage", m);
            }
            return View("GeneralWithdrawPage", m);
        }
    }
}
