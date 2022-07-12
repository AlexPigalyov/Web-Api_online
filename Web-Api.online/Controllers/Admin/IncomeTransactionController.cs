using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Admin
{
    [Route("/Admin/IncomeTransactions")]
    public class IncomeTransactionController : Controller
    {
        private readonly TransactionsRepository _transactionsRepository;

        public IncomeTransactionController(TransactionsRepository transactionsRepository)
        {
            _transactionsRepository = transactionsRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index(SortModel model)
        {
            int pageSize = 100;

            var incomeTransactions = await _transactionsRepository.GetPagedIncomeTransactions(model.Page, pageSize);
            var usersCount = await _transactionsRepository.GetCountOfIncomeTransactions();

            IncomeTransactionsViewModel viewModel = new IncomeTransactionsViewModel()
            {
                PageViewModel = new PageViewModel(usersCount, model.Page, pageSize),
                IncomeTransactions = incomeTransactions ?? new List<IncomeTransactionTableModel>()
            };

            return View("Views/Admin/IncomeTransactions.cshtml", viewModel);
        }
    }
}