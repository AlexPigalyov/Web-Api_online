using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Models.Tables
{
    public class BTC_USDT_OpenOrders
    {
        public int OpenOrderId { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public int SellingUserId { get; set; }
    }
}
