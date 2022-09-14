using System.Collections.Generic;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels.Profile
{
    public class MyIncomeTransactionsViewModel
    {
        public List<IncomeTransactionTableModel> IncomeTransactions { get; set; }

        public PageViewModel PageViewModel { get; set; }
    }
}
