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
        private readonly IDbConnection _db;

        public TradeRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<spGet_BTC_USDT_OpenOrder_ById> spGet_BTC_USDT_OpenOrder_ById(long openOrderId)
        {
            spGet_BTC_USDT_OpenOrder_ById result =
                await _db.QueryFirstAsync<spGet_BTC_USDT_OpenOrder_ById>(
                    "Get_BTC_USDT_OpenOrder_ById",
                    new { openOrderId = openOrderId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task<List<BTC_USDT_ClosedOrderTableModel>>
            spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(string userId)
        {
            List<BTC_USDT_ClosedOrderTableModel> result = (List<BTC_USDT_ClosedOrderTableModel>)
                await _db.QueryAsync<BTC_USDT_ClosedOrderTableModel>(
                    "Get_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate",
                    new { createUserId = userId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task spUpdate_BTC_USDT_OpenOrder(BTC_USDT_OpenOrderTableModel model, bool isBuy)
        {
            if (isBuy)
            {
                await _db.ExecuteAsync(
                "Update_BTC_USDT_OpenOrder_Buy",
                new
                {
                    userid = model.CreateUserId,
                    price = model.Price,
                    amount = model.Amount,
                    total = model.Total,
                    id = model.Id
                },
                commandType: CommandType.StoredProcedure);
            }
            else
            {
                await _db.ExecuteAsync(
                "Update_BTC_USDT_OpenOrder_Sell",
                new
                {
                    userid = model.CreateUserId,
                    price = model.Price,
                    amount = model.Amount,
                    total = model.Total,
                    id = model.Id
                },
                commandType: CommandType.StoredProcedure);
            }

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

        public async Task<spProcess_BTC_USDT_OrderResult> spProcess_BTC_USDT_Order(
            BTC_USDT_OpenOrderTableModel openOrder, bool isBuy)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("createUserId", openOrder.CreateUserId);
                p.Add("price", openOrder.Price);
                p.Add("amount", openOrder.Amount);
                p.Add("total", openOrder.Total);
                p.Add("createDate", openOrder.CreateDate);

                if (isBuy)
                {
                    return await _db.QueryFirstAsync<spProcess_BTC_USDT_OrderResult>(
                        $"Process_BTC_USDT_BuyOrder",
                        p,
                        commandType: CommandType.StoredProcedure);
                }
                else
                {
                    return await _db.QueryFirstAsync<spProcess_BTC_USDT_OrderResult>(
                        $"Process_BTC_USDT_SellOrder",
                        p,
                        commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                return await spProcess_BTC_USDT_Order(openOrder, isBuy);
            }
        }

        public async Task spMove_BTC_USDT_FromOpenOrdersToClosedOrders(spGet_BTC_USDT_OpenOrder_ById openOrder,
            string boughtUserId, ClosedOrderStatusEnum status)
        {
            try
            {
                if (openOrder.IsBuy)
                {
                    await _db.ExecuteAsync(
                    "Move_BTC_USDT_FromOpenOrdersBuyToClosedOrders",
                    new
                    {
                        createUserId = openOrder.CreateUserId,
                        boughtUserId = boughtUserId,
                        id = openOrder.Id,
                        price = openOrder.Price,
                        amount = openOrder.Amount,
                        total = openOrder.Total,
                        createDate = openOrder.CreateDate,
                        status = (int)status
                    },
                    commandType: CommandType.StoredProcedure);
                }
                else
                {
                    await _db.ExecuteAsync(
                    "Move_BTC_USDT_FromOpenOrdersBuyToClosedOrders",
                    new
                    {
                        createUserId = openOrder.CreateUserId,
                        boughtUserId = boughtUserId,
                        id = openOrder.Id,
                        price = openOrder.Price,
                        amount = openOrder.Amount,
                        total = openOrder.Total,
                        createDate = openOrder.CreateDate,
                        status = (int)status
                    },
                    commandType: CommandType.StoredProcedure);
                }

            }
            catch (Exception ex)
            {
            }
        }

        public async Task<List<spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate>>
            spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(string userId)
        {
            try
            {
                List<spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate> result =
                    (List<spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate>)
                    await _db.QueryAsync<spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate>(
                        "Get_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate",
                        new { createUserId = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
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
            catch (Exception ex)
            {
                return null;
            }
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
            catch
            {
                return null;
            }
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
            catch
            {
                return null;
            }
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
            catch
            {
                return null;
            }
        }

        public async Task<List<BTC_USDT_ClosedOrderTableModel>> GetAllBTCUSDTClosedOrders()
        {
            try
            {
                List<BTC_USDT_ClosedOrderTableModel> result =
                    (List<BTC_USDT_ClosedOrderTableModel>)await _db.QueryAsync<BTC_USDT_ClosedOrderTableModel>
                    ("Get_All_BTC_USDT_ClosedOrders",
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public async Task<int> GetCountOfClosedOreders()
        {
            try
            {
                return await _db.QueryFirstAsync<int>(
                    "GetCountOfClosedOreders",
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception exc)
            {
                return 0;
            }
        }
        public async Task<List<BTC_USDT_ClosedOrderTableModel>> GetBTCUSDTClosedOrdersPaged(int page, int pageSize)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("page", page);
                p.Add("pageSize", pageSize);

                List<BTC_USDT_ClosedOrderTableModel> result =
                    (List<BTC_USDT_ClosedOrderTableModel>)await _db.QueryAsync<BTC_USDT_ClosedOrderTableModel>
                    ("ClosedOrders_Paged",
                        p,
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;

            }
        }
    }
}
