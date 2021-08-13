using System;

namespace Web_Api.online.Models
{
    public class MarketTradesModel
    {
        public DateTime ClosedDate { get; set; }
        public bool IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
    }
}
