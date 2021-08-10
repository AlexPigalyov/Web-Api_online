using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models;
using System;

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
                List<spGet_BTC_USDT_OpenOrdersResult> result = (List<spGet_BTC_USDT_OpenOrdersResult>)
                    await db.QueryAsync<spGet_BTC_USDT_OpenOrdersResult>("exec spGet_BTC_USDT_OpenOrders");

                return result;
            }
        }

        public async Task<int> RemoveOpenOrderById(long id)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var res = await db.ExecuteAsync($"DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId={id}");

                    return res;
                }
                catch(Exception ex) { return 0; }
            }
        }

        public async Task<spGet_BTC_USDT_ClosedOrdersResult> Add_BTC_USDT_ClosedOrderAsync(spGet_BTC_USDT_ClosedOrdersResult order)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("createUserId", order.CreateUserId);
                    p.Add("boughtUserId", order.BoughtUserId);
                    p.Add("isBuy", order.IsBuy);
                    p.Add("price", order.Price);
                    p.Add("amount", order.Amount);
                    p.Add("createDate", order.CreateDate);
                    p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    var res = await db.QueryAsync<long>("spAdd_BTC_USDT_ClosedOrder", p, commandType: CommandType.StoredProcedure);

                    order.ClosedOrderId = res.FirstOrDefault();

                    return order;
                }
                catch(Exception ex) { return null; }
            }
        }

        public async Task<List<long>> UpdateOpenOrder(spGet_BTC_USDT_OpenOrdersResult order)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("userid", order.CreateUserId);
                    p.Add("isBuy", order.IsBuy);
                    p.Add("price", order.Price);
                    p.Add("amount", order.Amount);
                    p.Add("openOrderId", order.OpenOrderId);

                    var res = (await db.QueryAsync<long>("spUpdate_BTC_USDT_OpenOrder", p, commandType: CommandType.StoredProcedure));

                    return res.ToList();
                }
                catch { return null; }
            }
        }

        public async Task<List<OrderBookModel>> Get_BTC_USDT_OrderBookAsync(bool isBuy, int count = 15)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("isBuy", isBuy);

                    var res = (await db.QueryAsync<OrderBookModel>("spGet_BTC_USDT_SortedOrderBook", p, commandType: CommandType.StoredProcedure))
                        .ToList()
                        .Take(count);

                    return res.ToList();
                }
                catch { return null; }
            }
        }

        public async Task<spGet_BTC_USDT_OpenOrdersResult> Add_BTC_USDT_OrderAsync(spGet_BTC_USDT_OpenOrdersResult order)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("isBuy", order.IsBuy);
                    p.Add("price", order.Price);
                    p.Add("amount", order.Amount);
                    p.Add("userid", order.CreateUserId);
                    p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    var res = await db.QueryAsync<long>("spAdd_BTC_USDT_Order", p, commandType: CommandType.StoredProcedure);

                    order.OpenOrderId = res.FirstOrDefault();

                    return order;
                }
                catch { return null; }
            }
        }
    }
}
