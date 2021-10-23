namespace Web_Api.online.Models.StoredProcedures
{
    public class spProcess_BTC_USDT_OrderResult
    {
        public decimal Amount { get; set; }
        public long Id { get; set; }
        public string ClosedOrderUserId { get; set; }
        public long ClosedOrderId { get; set; }
    }
}
