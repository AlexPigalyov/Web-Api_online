namespace Web_Api.online.Models
{
    public class OrderBookModel
    {
        public int CountPrices { get; set; }
        public decimal Price { get; set; }
        public bool IsBuy { get; set; }
        public double Amount { get; set; }
    }
}
