using System.Collections.Generic;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class ClosedOrdersViewModel
    {
        public List<PairsTableModel> Pairs { get; set; }
        public List<ClosedOrderTableModel> ClosedOrders { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
