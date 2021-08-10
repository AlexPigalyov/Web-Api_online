using Web_Api.online.Models.StoredProcedures;

namespace Web_Api.online.Models
{
    public class ClosedOrder
    {
        public spGet_BTC_USDT_OpenOrdersResult Order { get; set; }
        public bool RemoveOpenOrderFromDataBase { get; set; }
    }
}
