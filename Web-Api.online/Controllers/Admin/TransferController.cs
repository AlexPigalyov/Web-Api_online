using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Controllers.Admin
{
    [Authorize(Roles = "Administrator")]
    [Route("/Admin/Transfers")]
    public class TransferController : Controller
    {
        private TransferRepository _transferRepository;

        public TransferController(TransferRepository transferRepository)
        {
            _transferRepository = transferRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var viewModel = await _transferRepository.GetTop10000Transfers();

            return View("Views/Admin/Transfers.cshtml", viewModel);
        }
    }
}