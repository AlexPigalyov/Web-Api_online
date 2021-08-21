namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetOrderByDescPrice_BTC_USDT_OrderBookResult
    {
        public int CountPrices { get; set; }
        public decimal Price { get; set; }
        public bool IsBuy { get; set; }
        public double Amount { get; set; }
    }
}
