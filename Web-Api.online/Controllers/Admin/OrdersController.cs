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
    [Route("/Admin/Orders")]
    public class OrdersController : Controller
    {
        private readonly TradeRepository _tradeRepository;

        public OrdersController(TradeRepository tradeRepository)
        {
            _tradeRepository = tradeRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            return View("Views/Admin/Orders.cshtml");
        }

        [HttpGet]
        [Route("ClearAllBotsOrders")]
        public async Task<IActionResult> ClearAllBotsOrders()
        {
            await _tradeRepository.ClearAllBotsOrders();

            return Ok();
        }
    }
}