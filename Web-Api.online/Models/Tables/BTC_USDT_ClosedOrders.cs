using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Models.Tables
{
    public class BTC_USDT_ClosedOrders
    {
        public int ClosedOrderId { get; set; }
        public System.DateTime CreateDate { get; set; }
        public System.DateTime ClosedDate { get; set; }
        public bool IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public string Status { get; set; }
        public int SoldUserId { get; set; }
        public int BoughtUserId { get; set; }
    }
}
