using Dapper;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Data;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Repositories
{
    public class ClosedOrdersRepository
        : BaseRepository<BTC_USDT_ClosedOrders, ExchangeContext>,
        IClosedOrdersRepository
    {
        private readonly IConfiguration _configuration;
        public ClosedOrdersRepository(
            ExchangeContext context,
            IConfiguration configuration)
            : base(context)
        {
            _configuration = configuration;
        }

        public async Task<List<MarketTradesModel>> Get_BTC_USDT_ClosedOrders()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var res = (await db.QueryAsync<MarketTradesModel>($"spGet_BTC_USDT_ClosedOrders", commandType: CommandType.StoredProcedure))
                        .ToList();

                    return res;
                }
                catch { return null; }
            }
        }
    }
}
