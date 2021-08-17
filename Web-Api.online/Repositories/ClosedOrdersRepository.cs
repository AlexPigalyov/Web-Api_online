using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Data;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Repositories
{
    public class ClosedOrdersRepository
        : BaseRepository<BTC_USDT_ClosedOrders, ExchangeContext>,
        IClosedOrdersRepository
    {
        private readonly IConfiguration _configuration;
        private readonly ExchangeContext _context;
        public ClosedOrdersRepository(
            ExchangeContext context,
            IConfiguration configuration)
            : base(context)
        {
            _context = context;
            _configuration = configuration;
        }

        public List<ClosedOrderModel> GetByUserId(string userId)
        {
            return _context.BTC_USDT_ClosedOrders
                .Where(x => x.CreateUserId == userId)
                .Select(x => new ClosedOrderModel()
                {
                    Amount = x.Amount,
                    ClosedDate = x.ClosedDate,
                    CreateDate = x.CreateDate,
                    IsBuy = x.IsBuy,
                    Price = x.Price,
                    Status = (x.Status ? ClosedOrderStatus.Completed : ClosedOrderStatus.Canceled)
                })
                .OrderByDescending(x => x.ClosedDate)
                .ToList();
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
