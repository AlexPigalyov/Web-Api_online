using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class ClosedOrder
    {
        public BTC_USDT_OpenOrders Order { get; set; }
        public bool RemoveOpenOrderFromDataBase { get; set; }
    }
}
