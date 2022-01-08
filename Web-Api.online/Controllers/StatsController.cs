using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Controllers
{
    public class StatsController : Controller
    {
        private TransactionsRepository _transactionsRepository;

        public StatsController(TransactionsRepository transactionsRepository)
        {
            _transactionsRepository = transactionsRepository;
        }

        public async Task<ActionResult> Incomings()
        {
            List<IncomeTransactionTableModel> incomes = await _transactionsRepository.GetAllIncomeTransactions();

            return View(incomes);
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
