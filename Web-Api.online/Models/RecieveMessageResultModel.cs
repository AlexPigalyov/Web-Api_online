using System.Collections.Generic;

using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class RecieveMessageResultModel
    {
        public List<spGetOrderByDescPriceOrderBookResult> OrderBookSell { get; set; }
        public List<spGetOrderByDescPriceOrderBookResult> OrderBookBuy { get; set; }
        public List<ClosedOrderTableModel> MarketTrades { get; set; }
    }
}
