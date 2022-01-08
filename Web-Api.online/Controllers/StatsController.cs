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
        private TransferRepository _transfer;

        public StatsController(TransactionsRepository transactionsRepository, TransferRepository transfer)
        {
            _transactionsRepository = transactionsRepository;
            _transfer = transfer;
        }

        public async Task<ActionResult> Incomings()
        {
            List<IncomeTransactionTableModel> incomes = await _transactionsRepository.GetAllIncomeTransactions();

            return View(incomes);
        }
        public async Task<ActionResult> Transfers()
        {
            List<TransferTableModel> transfers = await _transfer.GetAllTransfers();

            return View(transfers);
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
