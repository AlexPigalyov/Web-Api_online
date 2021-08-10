using System;

namespace Web_Api.online.Models.StoredProcedures
{
    public class spGet_BTC_USDT_ClosedOrdersResult
    {
        public long ClosedOrderId { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ClosedDate { get; set; }
        public bool? IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public string CreateUserId { get; set; }
        public string BoughtUserId { get; set; }
    }
}
