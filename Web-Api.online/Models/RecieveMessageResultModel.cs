using System.Collections.Generic;

namespace Web_Api.online.Models
{
    public class RecieveMessageResultModel
    {
        public List<OrderBookModel> OrderBook { get; set; }
        public bool IsBuy { get; set; }
    }
}
