using System.Collections.Generic;

namespace Web_Api.online.Models
{
    public class RecieveMessageResultModel
    {
        public List<OrderBookModel> OrderBookSell { get; set; }
        public List<OrderBookModel> OrderBookBuy { get; set; }
        public bool IsBuy { get; set; }
    }
}
