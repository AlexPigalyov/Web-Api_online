using System.Collections.Generic;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class TransfersViewModel
    {
        public List<TransferTableModel> IncomeTransactions { get; set; }
        public PageViewModel PageViewModel { get; set; }
        public int ItemsCount { get; set; }
    }
}
