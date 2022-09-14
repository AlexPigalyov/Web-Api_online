namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetOrderByDescPriceOrderBookResult
    {
        public int CountPrices { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total {  get; set; }
    }
}
