using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;

namespace Web_Api.online.Models.ViewModels
{
    public class OutcomeTransactionsViewModel
    {
        public List<spGetOutcomeTransactions_Paged> OutcomeTransactions { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}