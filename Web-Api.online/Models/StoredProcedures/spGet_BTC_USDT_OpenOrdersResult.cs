using System;

namespace Web_Api.online.Models.StoredProcedures
{
    public class spGet_BTC_USDT_OpenOrdersResult
    {
        public long OpenOrderId { get; set; }
        public DateTime CreateDate { get; set; }
        public bool? IsBuy { get; set; }
        public double Price { get; set; }
        public double Amount { get; set; }
        public double Total { get; set; }
        public string CreateUserId { get; set; }
    }
}
