using System.Collections.Generic;
using System.Threading.Tasks;

using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories.Abstract
{
    public interface IOpenOrdersRepository
        : IBaseRepository<BTC_USDT_OpenOrders>
    {
        Task<List<BTC_USDT_OpenOrders>> Get_BTC_USDT_OpenOrdersAsync();
        Task<List<OrderBookModel>> Get_BTC_USDT_OrderBookAsync(bool isBuy, int count = 15);
    }
}
