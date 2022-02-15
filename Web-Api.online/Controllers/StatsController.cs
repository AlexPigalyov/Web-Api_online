using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers
{
    public class StatsController : Controller
    {
        private TransactionsRepository _transactionsRepository;
        private TransferRepository _transferRepository;
        private OutcomeTransactionRepository _outcomeRepository;
        private TradeRepository _tradeRepository;
        private UsersInfoRepository _usersInfoRepository;


        public StatsController(TransactionsRepository transactionsRepository, TransferRepository transferRepository,
            OutcomeTransactionRepository outcomeRepository, TradeRepository tradeRepository, UsersInfoRepository usersInfoRepository)
        {
            _transactionsRepository = transactionsRepository;
            _transferRepository = transferRepository;
            _outcomeRepository = outcomeRepository;
            _tradeRepository = tradeRepository;
            _usersInfoRepository = usersInfoRepository;
        }

        public async Task<ActionResult> Incomings()
        {
            var incomes = await _transactionsRepository.GetIncomeTransactionsPaged(1, 100);
            
            return View(incomes);
        }
        public async Task<ActionResult> Transfers()
        {
            var transfers = await _transferRepository.GetTransfersPaged(1,100);

            return View(transfers);
        }


        public async Task<ActionResult> Withdraw()
        {
            List<OutcomeTransactionTableModel> outcome = await _outcomeRepository.GetAllOutcomeTransactions();

            return View(outcome);
        }

        public async Task<ActionResult> Orders()
        {
            List<BTC_USDT_ClosedOrderTableModel> closedorders = await _tradeRepository.GetAllBTCUSDTClosedOrders();

            return View(closedorders);
        }

        public async Task<ActionResult> RegistratedUsers()
        {
            List<RegistratedUsersViewModel> users = await _usersInfoRepository.GetAllRegistratedUsers();

            return View(users);
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
