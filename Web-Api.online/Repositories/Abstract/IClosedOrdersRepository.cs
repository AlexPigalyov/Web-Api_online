using System.Collections.Generic;
using System.Threading.Tasks;

using Web_Api.online.Models;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories.Abstract
{
    public interface IClosedOrdersRepository
        : IBaseRepository<BTC_USDT_ClosedOrders>
    {
        Task<List<MarketTradesModel>> Get_BTC_USDT_ClosedOrders();
    }
}
