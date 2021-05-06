using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public class TradeRepository
    {
        private readonly IConfiguration _configuration;

        public TradeRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<spGet_BTC_USDT_OpenOrdersResult>> Get_BTC_USDT_OpenOrdersAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                List<spGet_BTC_USDT_OpenOrdersResult> result = (List<spGet_BTC_USDT_OpenOrdersResult>)(await db.QueryAsync<spGet_BTC_USDT_OpenOrdersResult>("exec spGet_BTC_USDT_OpenOrders"));

                return result;
            }
        }

    }
}
