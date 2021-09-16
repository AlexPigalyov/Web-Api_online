using System.Collections.Generic;

using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.MVCPages
{
    public class BTC_USDTModel
    {
        public string UserId { get; set; }
        public List<Wallet> UserWallets { get; set; }
        public Wallet BtcWallet { get; set; }
        public Wallet UsdtWallet { get; set; }
        public List<BTC_USDT_ClosedOrders> MarketTrades { get; set; }
        public List<BTC_USDT_OpenOrders> UserOpenOrders { get; set; }
        public List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> BuyOrderBook { get; set; }
        public List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> SellOrderBook { get; set; }
    }
}
