using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.Constants;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Admin
{
    [Authorize(Roles = "Administrator")]
    [Route("/Admin/Pairs")]
    public class PairsController : Controller
    {
        private readonly PairsRepository _pairsRepository;

        public PairsController(PairsRepository pairsRepository)
        {
            _pairsRepository = pairsRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var pairs = await _pairsRepository.GetAllPairsAsync();

            PairsViewModel viewModel = new PairsViewModel()
            {
                Pairs = pairs
            };

            return View("Views/Admin/Pairs.cshtml", viewModel);
        }

        [Route("/Admin/Pairs/CreateNewPair")]
        [HttpGet]
        public IActionResult CreateNewPair()
        {
            return View("Views/Admin/CreateNewPair.cshtml");
        }

        [HttpPost]
        [Route("Create")]
        public async Task<IActionResult> Create([FromBody] CreatePairRequestModel model)
        {
            await _pairsRepository.Create(model.FirstCurrency, model.SecondCurrency);

            return Ok();
        }
    }
}