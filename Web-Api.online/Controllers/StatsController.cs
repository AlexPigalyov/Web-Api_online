using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;
using static Web_Api.online.API.Controllers.CurrenciesController;

namespace Web_Api.online.Controllers
{
    public class StatsController : Controller
    {
        private WalletsRepository _walletsRepository;
        private TransactionsRepository _transactionsRepository;
        private TransferRepository _transferRepository;
        private IOutcomeTransactionRepository _outcomeRepository;
        private TradeRepository _tradeRepository;
        private UsersInfoRepository _usersInfoRepository;
        private UserRepository _userRepository;
        private readonly PairsRepository _pairsRepository;

        public StatsController(WalletsRepository walletsRepository,
            TransactionsRepository transactionsRepository,
            TransferRepository transferRepository,
            IOutcomeTransactionRepository outcomeRepository,
            TradeRepository tradeRepository,
            UsersInfoRepository usersInfoRepository,
            UserRepository userRepository,
            PairsRepository pairsRepository)
        {
            _walletsRepository = walletsRepository;
            _transactionsRepository = transactionsRepository;
            _transferRepository = transferRepository;
            _outcomeRepository = outcomeRepository;
            _tradeRepository = tradeRepository;
            _usersInfoRepository = usersInfoRepository;
            _userRepository = userRepository;
            _pairsRepository = pairsRepository;
        }

        public async Task<ActionResult> IncomeTransactions(SortModel model)
        {
            int pageSize = 100;

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
            int pageSize = 100;

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
            int pageSize = 100;

            var outcomes = await _outcomeRepository.GetOutcomeTransactionsPaged(model.Page, pageSize);
            var itemsCount = await _outcomeRepository.GetCountOfOutcomeTransactions();

            OutcomeTransactionsViewModel viewModel = new OutcomeTransactionsViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                OutcomeTransactions = outcomes ?? new List<OutcomeTransactionTableModel>()
            };
            return View(viewModel);
        }

        public async Task<ActionResult> Orders(SortModel model, string Pair)
        {
            if (string.IsNullOrEmpty(Pair))
            {
                Pair = "BTCUSDT";
            }

            int pageSize = 100;

            var pairs = await _pairsRepository.GetAllPairsAsync();

            var currentPair = pairs.FirstOrDefault(x => x.Acronim == Pair);

            if (currentPair == null) { return NotFound(); }

            var closedOrders = await _tradeRepository.GetClosedOrdersByPairPaged(currentPair.SQLTableName, model.Page, pageSize);
            var itemsCount = await _tradeRepository.GetCountOfClosedOrders();

            ClosedOrdersViewModel viewModel = new ClosedOrdersViewModel()
            {
                Pairs = pairs,
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                ClosedOrders = closedOrders ?? new List<ClosedOrderTableModel>()
            };

            return View(viewModel);
        }

        public async Task<ActionResult> RegistratedUsers(SortModel model)
        {
            int pageSize = 100;

            List<RegistratedUsersTableModel> users = await _usersInfoRepository.GetRegistratedUsersPaged(model.Page, pageSize);
            int itemsCount = await _usersInfoRepository.GetCountOfRegistratedUsers();

            RegistratedUsersViewModel viewModel = new RegistratedUsersViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                RegistratedUsers = users ?? new List<RegistratedUsersTableModel>()
            };

            return View(viewModel);
        }

        public async Task<ActionResult> RefferalsUsers(SortModel model)
        {
            int pageSize = 100;

            var reffUsers = await _userRepository.GetRefferersPaged(model.Page, pageSize);
            var itemsCount = await _userRepository.GetCountUserRefferer();

            UserRefferalViewModel viewModel = new UserRefferalViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                UserRefferal = reffUsers ?? new List<UserRefferalTableModel>()
            };

            return View(viewModel);
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
