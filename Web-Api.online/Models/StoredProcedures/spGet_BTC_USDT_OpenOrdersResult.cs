using System;

namespace Web_Api.online.Models.StoredProcedures
{
    public class spGet_BTC_USDT_OpenOrdersResult
    {
        public long OpenOrderId { get; set; }
        public DateTime CreateDate { get; set; }
        public bool? IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public string CreateUserId { get; set; }
    }
}
