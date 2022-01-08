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
        private TransferRepository _transferRepository;
        private OutcomeTransactionRepository _outcomeRepository;
        private TradeRepository _tradeRepository;

        public StatsController(TransactionsRepository transactionsRepository, TransferRepository transferRepository, 
            OutcomeTransactionRepository outcomeRepository, TradeRepository tradeRepository)
        {
            _transactionsRepository = transactionsRepository;
            _transferRepository = transferRepository;
            _outcomeRepository = outcomeRepository;
            _tradeRepository = tradeRepository;
        }

        public async Task<ActionResult> Incomings()
        {
            List<IncomeTransactionTableModel> incomes = await _transactionsRepository.GetAllIncomeTransactions();

            return View(incomes);
        }
        public async Task<ActionResult> Transfers()
        {
            List<TransferTableModel> transfers = await _transferRepository.GetAllTransfers();

            return View(transfers);
        }


        public async Task<ActionResult> Outcome()
        {
            List<OutcomeTransactionTableModel> outcome = await _outcomeRepository.GetAllOutcomeTransactions();

            return View(outcome);
        }

        public async Task<ActionResult> Orders()
        {
            List<BTC_USDT_ClosedOrderTableModel> closedorders = await _tradeRepository.GetAllBTCUSDTClosedOrders();

            return View(closedorders);
        }
        
        public ActionResult Index()
        {
            return View();
        }
    }
}
