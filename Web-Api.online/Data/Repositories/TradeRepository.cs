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

namespace Web_Api.online.Data.Repositories
{
    public class TradeRepository
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnection _db;

        public TradeRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<BTC_USDT_OpenOrderTableModel> spGet_BTC_USDT_OpenOrder_ById(long openOrderId)
        {
            BTC_USDT_OpenOrderTableModel result =
                await _db.QueryFirstAsync<BTC_USDT_OpenOrderTableModel>(
                    "Get_BTC_USDT_OpenOrder_ById",
                    new { openOrderId = openOrderId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task<List<BTC_USDT_ClosedOrderTableModel>> spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(string userId)
        {
            List<BTC_USDT_ClosedOrderTableModel> result = (List<BTC_USDT_ClosedOrderTableModel>)
                await _db.QueryAsync<BTC_USDT_ClosedOrderTableModel>(
                    "Get_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate",
                    new { createUserId = userId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task spUpdate_BTC_USDT_OpenOrder(BTC_USDT_OpenOrderTableModel model)
        {
            await _db.ExecuteAsync(
                "Update_BTC_USDT_OpenOrder",
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

        public async Task<decimal> spGetLastPrice_BTC_USDT_ClosedOrder()
        {
            try
            {
                return await _db.QueryFirstAsync<decimal>(
                    "GetLastPrice_BTC_USDT_ClosedOrder",
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public async Task<spProcess_BTC_USDT_Order> spProcess_BTC_USDT_Order(BTC_USDT_OpenOrderTableModel openOrder)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("createUserId", openOrder.CreateUserId);
                p.Add("isBuy", openOrder.IsBuy);
                p.Add("price", openOrder.Price);
                p.Add("amount", openOrder.Amount);
                p.Add("total", openOrder.Total);
                p.Add("createDate", openOrder.CreateDate);

                if (openOrder.IsBuy)
                {
                    return await _db.QueryFirstAsync<spProcess_BTC_USDT_Order>(
                        $"Process_BTC_USDT_BuyOrder",
                        p,
                        commandType: CommandType.StoredProcedure);
                }
                else
                {
                    return await _db.QueryFirstAsync<spProcess_BTC_USDT_Order>(
                        $"Process_BTC_USDT_SellOrder",
                        p,
                        commandType: CommandType.StoredProcedure);
                }
            }
            catch(Exception ex)
            {
                return await spProcess_BTC_USDT_Order(openOrder);
            }
        }

        public async Task spMove_BTC_USDT_FromOpenOrdersToClosedOrders(BTC_USDT_OpenOrderTableModel openOrder, string boughtUserId, ClosedOrderStatusEnum status)
        {
            try
            {
                await _db.ExecuteAsync(
                    "Move_BTC_USDT_FromOpenOrdersToClosedOrders",
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
            }
            catch (Exception ex) { }
        }

        public async Task<List<BTC_USDT_OpenOrderTableModel>> spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(string userId)
        {
            try
            {
                List<BTC_USDT_OpenOrderTableModel> result = (List<BTC_USDT_OpenOrderTableModel>)
                await _db.QueryAsync<BTC_USDT_OpenOrderTableModel>(
                    "Get_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate",
                    new { createUserId = userId },
                    commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<long> spCreate_BTC_USDT_Order(BTC_USDT_OpenOrderTableModel model)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("userid", model.CreateUserId);
                parameters.Add("isBuy", model.IsBuy);
                parameters.Add("price", model.Price);
                parameters.Add("amount", model.Amount);
                parameters.Add("total", model.Total);
                parameters.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                long result = await _db.QueryFirstAsync<long>(
                    "Create_BTC_USDT_OpenOrder",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex) { return 0; }
        }

        public async Task<List<BTC_USDT_OpenOrderTableModel>> Get_BTC_USDT_OpenOrdersAsync()
        {
            try
            {
                List<BTC_USDT_OpenOrderTableModel> result = (List<BTC_USDT_OpenOrderTableModel>)
                await _db.QueryAsync<BTC_USDT_OpenOrderTableModel>(
                    "Get_BTC_USDT_OpenOrders",
                    commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<List<BTC_USDT_ClosedOrderTableModel>> spGet_BTC_USDT_ClosedOrders_Top100()
        {
            try
            {
                var res = (List<BTC_USDT_ClosedOrderTableModel>)
                    await _db.QueryAsync<BTC_USDT_ClosedOrderTableModel>(
                        "Get_BTC_USDT_ClosedOrders_Top100",
                        commandType: CommandType.StoredProcedure);

                return res;
            }
            catch { return null; }
        }

        public async Task<List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult>> Get_BTC_USDT_SellOrderBookAsync()
        {
            try
            {
                return (await _db.QueryAsync<spGetOrderByDescPrice_BTC_USDT_OrderBookResult>(
                        $"Get_BTC_USDT_OrderBookSell_OrderByPrice",
                        commandType: CommandType.StoredProcedure))
                    .ToList();
            }
            catch { return null; }
        }

        public async Task<List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult>> Get_BTC_USDT_BuyOrderBookAsync()
        {
            try
            {
                return (await _db.QueryAsync<spGetOrderByDescPrice_BTC_USDT_OrderBookResult>(
                    $"Get_BTC_USDT_OrderBookBuy_OrderByDescPrice",
                    commandType: CommandType.StoredProcedure))
                .ToList();
            }
            catch { return null; }
        }
    }
}
