using System.Collections.Generic;

using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class RecieveMessageResultModel
    {
        public List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> OrderBookSell { get; set; }
        public List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> OrderBookBuy { get; set; }
        public List<BTC_USDT_ClosedOrderTableModel> MarketTrades { get; set; }
        public BTC_USDT_OpenOrderTableModel CurrentOrder { get; set; }
        public bool IsBuy { get; set; }
    }
}
