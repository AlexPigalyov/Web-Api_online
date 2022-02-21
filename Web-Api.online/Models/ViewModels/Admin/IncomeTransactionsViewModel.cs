using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class IncomeTransactionsViewModel
    {
        public List<IncomeTransactionTableModel> IncomeTransactions { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}