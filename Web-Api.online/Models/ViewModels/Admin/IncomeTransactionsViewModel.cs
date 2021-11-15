using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;

namespace Web_Api.online.Models.ViewModels
{
    public class IncomeTransactionsViewModel
    {
        public List<spGetIncomeTransactions_Paged> IncomeTransactions { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}