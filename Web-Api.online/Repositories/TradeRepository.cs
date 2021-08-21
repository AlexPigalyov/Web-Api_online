using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
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

        public async Task<BTC_USDT_OpenOrders> spGet_BTC_USDT_OpenOrder_ById(long openOrderId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                BTC_USDT_OpenOrders result =
                    await db.QueryFirstAsync<BTC_USDT_OpenOrders>(
                        "spGet_BTC_USDT_OpenOrder_ById",
                        new { openOrderId = openOrderId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }

        public async Task<List<BTC_USDT_ClosedOrders>> spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                List<BTC_USDT_ClosedOrders> result = (List<BTC_USDT_ClosedOrders>)
                    await db.QueryAsync<BTC_USDT_ClosedOrders>(
                        "spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate",
                        new { createUserId = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }

        public async Task spUpdate_BTC_USDT_OpenOrder(BTC_USDT_OpenOrders model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                await db.ExecuteAsync(
                    "spUpdate_BTC_USDT_OpenOrder",
                    new
                    {
                        userid = model.CreateUserId,
                        isBuy = model.IsBuy,
                        price = model.Price,
                        amount = model.Amount,
                        total = model.Total,
                        openOrderId = model.OpenOrderId
                    },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task spMove_BTC_USDT_FromOpenOrdersToClosedOrders(BTC_USDT_OpenOrders openOrder, string boughtUserId, ClosedOrderStatus status)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    await db.ExecuteAsync(
                        "spMove_BTC_USDT_FromOpenOrdersToClosedOrders",
                        new
                        {
                            createUserId = openOrder.CreateUserId,
                            boughtUserId = boughtUserId,
                            closedOrderId = openOrder.OpenOrderId,
                            isBuy = openOrder.IsBuy,
                            price = openOrder.Price,
                            amount = openOrder.Amount,
                            total = openOrder.Total,
                            createDate = openOrder.CreateDate,
                            status = (int)status
                        },
                        commandType: CommandType.StoredProcedure);
                } catch (Exception ex) { }
            }
        }

        public async Task<List<BTC_USDT_OpenOrders>> spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    List<BTC_USDT_OpenOrders> result = (List<BTC_USDT_OpenOrders>)
                    await db.QueryAsync<BTC_USDT_OpenOrders>(
                        "spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate",
                        new { createUserId = userId },
                        commandType: CommandType.StoredProcedure);

                    return result;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<long> spAdd_BTC_USDT_Order(Args_spAdd_BTC_USDT_OpenOrder model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("userid", model.UserId);
                    parameters.Add("isBuy", model.IsBuy);
                    parameters.Add("price", model.Price);
                    parameters.Add("amount", model.Amount);
                    parameters.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    long result = await db.QueryFirstAsync<long>(
                        "spAdd_BTC_USDT_OpenOrder",
                        parameters,
                        commandType: CommandType.StoredProcedure);

                    return result;
                }
                catch (Exception ex) { return 0; }
            }
        }

        public async Task<List<BTC_USDT_OpenOrders>> Get_BTC_USDT_OpenOrdersAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    List<BTC_USDT_OpenOrders> result = (List<BTC_USDT_OpenOrders>)
                    await db.QueryAsync<BTC_USDT_OpenOrders>(
                        "spGet_BTC_USDT_OpenOrders",
                        commandType: CommandType.StoredProcedure);

                    return result;
                }
                catch (Exception ex) { return null; }

            }
        }

        public async Task<List<BTC_USDT_ClosedOrders>> spGet_BTC_USDT_ClosedOrders_Top100()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var res = (List<BTC_USDT_ClosedOrders>)
                        await db.QueryAsync<BTC_USDT_ClosedOrders>(
                            "spGet_BTC_USDT_ClosedOrders_Top100",
                            commandType: CommandType.StoredProcedure);

                    return res;
                }
                catch { return null; }
            }
        }

        public async Task<List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult>> Get_BTC_USDT_OrderBookAsync(bool isBuy, int count = 15)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var isBuyStr = isBuy ? "Buy" : "Sell";

                    var res = (await db.QueryAsync<spGetOrderByDescPrice_BTC_USDT_OrderBookResult>(
                        $"spGet_BTC_USDT_OrderBook{isBuyStr}_OrderBy{(isBuy ? "" : "Desc")}Price",
                        commandType: CommandType.StoredProcedure))
                    .Take(count);

                    return res.ToList();
                }
                catch { return null; }
            }
        }
    }
}
