using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
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
        private UserRepository _userRepository;


        public StatsController(TransactionsRepository transactionsRepository, TransferRepository transferRepository,
            OutcomeTransactionRepository outcomeRepository, TradeRepository tradeRepository, UsersInfoRepository usersInfoRepository, UserRepository userRepository)
        {
            _transactionsRepository = transactionsRepository;
            _transferRepository = transferRepository;
            _outcomeRepository = outcomeRepository;
            _tradeRepository = tradeRepository;
            _usersInfoRepository = usersInfoRepository;
            _userRepository = userRepository;
        }

        public async Task<ActionResult> IncomeTransactions(SortModel model)
        {
            int pageSize = 15;

            var incomeTransactions = await _transactionsRepository.GetPagedIncomeTransactions(model.Page, pageSize);
            var itemsCount = await _transactionsRepository.GetCountOfIncomeTransactions();



            IncomeTransactionsViewModel viewModel = new IncomeTransactionsViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                IncomeTransactions = incomeTransactions ?? new List<IncomeTransactionTableModel>()
            };

            return View(viewModel);
        }
        public async Task<ActionResult> Transfers(SortModel model)
        {
            int pageSize = 15;

            var transfers = await _transferRepository.GetTransfersPaged(model.Page, pageSize);
            var itemsCount = await _transferRepository.GetCountOfTransfers();

            TransfersViewModel viewModel = new TransfersViewModel
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                Transfers = transfers ?? new List<TransferTableModel>()
            };

            return View(viewModel);
        }


        public async Task<ActionResult> Withdraw(SortModel model)
        {
            int pageSize = 15;

            var outcomes = await _outcomeRepository.GetOutcomeTransactionsPaged(model.Page, pageSize);
            var itemsCount = await _outcomeRepository.GetCountOfOutcomeTransactions();

            OutcomeTransactionsViewModel viewModel = new OutcomeTransactionsViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                OutcomeTransactions = outcomes ?? new List<OutcomeTransactionTableModel>()
            };
            return View(viewModel);
        }

        public async Task<ActionResult> Orders(SortModel model)
        {
            int pageSize = 15;

            var closedOrders = await _tradeRepository.GetBTCUSDTClosedOrdersPaged(model.Page, pageSize);
            var itemsCount = await _tradeRepository.GetCountOfClosedOreders();

            ClosedOrdersViewModel viewModel = new ClosedOrdersViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                ClosedOrders = closedOrders ?? new List<BTC_USDT_ClosedOrderTableModel>()
            };

            return View(viewModel);
        }

        public async Task<ActionResult> RegistratedUsers(SortModel model)
        {
            int pageSize = 15;

            var users = await _usersInfoRepository.GetRegistratedUsersPaged(model.Page, pageSize);
            var itemsCount = await _usersInfoRepository.GetCountOfRegistratedUsers();

            RegistratedUsersViewModel viewModel = new RegistratedUsersViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                RegistratedUsers = users ?? new List<RegistratedUsersTableModel>()
            };

            return View(viewModel);
        }
        public async Task<ActionResult> RefferalsUsers()
        {
            var reffUsers = await _userRepository.GetAllRefferals();

            return View(reffUsers);

        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
