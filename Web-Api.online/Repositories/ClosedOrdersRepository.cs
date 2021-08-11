using Web_Api.online.Data;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Repositories
{
    public class ClosedOrdersRepository
        : BaseRepository<BTC_USDT_ClosedOrders, ExchangeContext>,
        IClosedOrdersRepository
    {
        public ClosedOrdersRepository(ExchangeContext context)
            : base(context)
        {
        }
    }
}
