using System.Collections.Generic;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class RecieveMessageResultModel
    {
        public List<OrderBookModel> OrderBookSell { get; set; }
        public List<OrderBookModel> OrderBookBuy { get; set; }
        public List<MarketTradesModel> MarketTrades { get; set; }
        public BTC_USDT_OpenOrders CurrentOrder { get; set; }
        public bool IsBuy { get; set; }
    }
}
