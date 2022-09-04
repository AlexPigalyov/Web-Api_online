using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Admin
{
    [Authorize(Roles = "Administrator")]
    [Route("/Admin/OutcomeTransactions")]
    public class OutcomeTransactionController : Controller
    {
        private readonly IOutcomeTransactionRepository _outcomeTransactionsRepository;

        public OutcomeTransactionController(IOutcomeTransactionRepository outcomeTransactionsRepository)
        {
            _outcomeTransactionsRepository = outcomeTransactionsRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index(SortModel model)
        {
            int pageSize = 15;

            var outcomeTransactions = await _outcomeTransactionsRepository.GetOutcomeTransactionsPaged(model.Page, pageSize);
            var usersCount = await _outcomeTransactionsRepository.GetCountOfOutcomeTransactions();

            OutcomeTransactionsViewModel viewModel = new OutcomeTransactionsViewModel()
            {
                PageViewModel = new PageViewModel(usersCount, model.Page, pageSize),
                OutcomeTransactions = outcomeTransactions ?? new List<OutcomeTransactionTableModel>()
            };

            return View("Views/Admin/OutcomeTransactions.cshtml", viewModel);
        }
    }
}