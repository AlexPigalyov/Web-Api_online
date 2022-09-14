using System.Collections.Generic;

using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class BTC_USDTViewModel
    {
        public string UserId { get; set; }
        public List<WalletTableModel> UserWallets { get; set; }
        public WalletTableModel BtcWallet { get; set; }
        public WalletTableModel UsdtWallet { get; set; }
        public List<ClosedOrderTableModel> MarketTrades { get; set; }
        public List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate> UserOpenOrders { get; set; }
        public List<spGetOrderByDescPriceOrderBookResult> BuyOrderBook { get; set; }
        public List<spGetOrderByDescPriceOrderBookResult> SellOrderBook { get; set; }
        public List<CandleStickTableModel> CandleStick { get; set; }
    }
}
