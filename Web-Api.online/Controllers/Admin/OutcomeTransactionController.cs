using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Admin
{
    [Route("/Admin/IncomeTransactions")]
    public class OutcomeTransactionController : Controller
    {
        private readonly OutcomeTransactionRepository _outcomeTransactionsRepository;

        public OutcomeTransactionController(OutcomeTransactionRepository outcomeTransactionsRepository)
        {
            _outcomeTransactionsRepository = outcomeTransactionsRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index(SortModel model)
        {
            int pageSize = 15;

            var outcomeTransactions = await _outcomeTransactionsRepository.GetPagedOutcomeTransactions(model.Page, pageSize);
            var usersCount = await _outcomeTransactionsRepository.GetCountOfOutcomeTransactions();

            OutcomeTransactionsViewModel viewModel = new OutcomeTransactionsViewModel()
            {
                PageViewModel = new PageViewModel(usersCount, model.Page, pageSize),
                OutcomeTransactions = outcomeTransactions
            };

            return View("Views/Admin/OutcomeTransactions.cshtml", viewModel);
        }
    }
}