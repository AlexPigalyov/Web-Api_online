using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
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
			int pageSize = 3;

			var incomeTransactions = await _transactionsRepository.GetPagedIncomeTransactions(model.Page,pageSize);
			var usersCount = await _transactionsRepository.GetCountOfIncomeTransactions();

			IncomeTransactionsViewModel viewModel = new IncomeTransactionsViewModel()
			{
				PageViewModel = new PageViewModel(usersCount, model.Page, pageSize),
				IncomeTransactions = incomeTransactions ?? new List<IncomeTransactionTableModel>()
			};

			return View("Views/Stats/IncomeTransactions.cshtml", viewModel);
		}
		public async Task<ActionResult> Transfers(int pageIndex = 1)
		{
			var transfers = await _transferRepository.GetTransfersPaged(1, 100);

			return View(transfers);
		}


		public async Task<ActionResult> Withdraw(int pageIndex = 1)
		{
			var outcome = await _outcomeRepository.GetOutcomeTransactionsPaged(1, 100);

			return View(outcome);
		}

		public async Task<ActionResult> Orders(int pageIndex = 1)
		{
			var closedorders = await _tradeRepository.GetBTCUSDTClosedOrdersPaged(1, 100);

			return View(closedorders);
		}

		public async Task<ActionResult> RegistratedUsers(int pageIndex = 1)
		{
			var users = await _usersInfoRepository.GetRegistratedUsersPaged(1, 3);

			return View(users);
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
