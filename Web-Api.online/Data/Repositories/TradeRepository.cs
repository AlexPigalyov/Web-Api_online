using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
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

        public async Task<List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate>>
            GetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate(string userId, string sqlPairName)
        {
            try
            {
                List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate> result =
                    (List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate>)
                    await _db.QueryAsync<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate>(
                        $"Get_{sqlPairName}_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate",
                        new { createUserId = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<spGetOpenOrder_ById> GetOpenOrderById(string firstCurrency, string secondCurrency,
            long openOrderId)
        {
            var result =
                await _db.QueryFirstAsync<spGetOpenOrder_ById>(
                    $"Get_{firstCurrency}_{secondCurrency}_OpenOrder_ById",
                    new { openOrderId = openOrderId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task<List<ClosedOrderTableModel>>
            spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(string userId)
        {
            List<ClosedOrderTableModel> result = (List<ClosedOrderTableModel>)
                await _db.QueryAsync<ClosedOrderTableModel>(
                    "Get_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate",
                    new { createUserId = userId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task<List<ClosedOrderTableModel>> spGetClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(string userId, string sqlPairName)
        {
            List<ClosedOrderTableModel> result = (List<ClosedOrderTableModel>)
                await _db.QueryAsync<ClosedOrderTableModel>(
                    $"Get_{sqlPairName}_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate",
                    new { createUserId = userId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task<spProcessOrderResult> ProcessOrder(OpenOrderTableModel openOrder, bool isBuy)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("createUserId", openOrder.CreateUserId);
                p.Add("price", openOrder.Price);
                p.Add("amount", openOrder.Amount);
                p.Add("total", openOrder.Total);
                p.Add("createDate", openOrder.CreateDate);

                return await _db.QueryFirstAsync<spProcessOrderResult>(
                    $"Process_{openOrder.CryptExchangePair.ToUpper()}_{(isBuy ? "Buy" : "Sell")}Order",
                    p,
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                return await ProcessOrder(openOrder, isBuy);
            }
        }

        public async Task MoveFromOpenToClosedOrders(spGetOpenOrder_ById openOrder, string boughtUserId, ClosedOrderStatusEnum status, string pair)
        {
            try
            {
                await _db.ExecuteAsync(
                    "MoveFromOpenToClosedOrders",
                    new
                    {
                        pair = pair,
                        buyOrSell = openOrder.IsBuy ? "Buy" : "Sell",
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
            catch (Exception ex)
            {
            }
        }

        public async Task<List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate>> spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate(string userId)
        {
            try
            {
                List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate> result =
                    (List<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate>)
                    await _db.QueryAsync<spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate>(
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

        public async Task<List<spGetOpenOrdersByUser>> spGet_OpenOrders_ByUser(string userId)
        {
            try
            {
                List<spGetOpenOrdersByUser> result =
                    (List<spGetOpenOrdersByUser>)
                    await _db.QueryAsync<spGetOpenOrdersByUser>(
                        "Get_OpenOrders_ByUserId",
                        new { createUserId = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<List<ClosedOrderTableModel>> GetClosedOrders_Top100(string sqlPairName)
        {
            try
            {
                var res = (List<ClosedOrderTableModel>)
                    await _db.QueryAsync<ClosedOrderTableModel>(
                        $"Get_{sqlPairName}_ClosedOrders_Top100",
                        commandType: CommandType.StoredProcedure);

                return res;
            }
            catch
            {
                return null;
            }
        }

        public async Task<List<spGetOrderByDescPriceOrderBookResult>> Get_BTC_USDT_SellOrderBookAsync()
        {
            try
            {
                return (await _db.QueryAsync<spGetOrderByDescPriceOrderBookResult>(
                        $"Get_BTC_USDT_OrderBookSell_OrderByPrice",
                        commandType: CommandType.StoredProcedure))
                    .ToList();
            }
            catch
            {
                return null;
            }
        }

        public async Task<List<spGetOrderByDescPriceOrderBookResult>> GetSellOrderBookAsync(string sqlPairName)
        {
            try
            {
                return (await _db.QueryAsync<spGetOrderByDescPriceOrderBookResult>(
                        $"Get_{sqlPairName}_OrderBookSell_OrderByPrice",
                        commandType: CommandType.StoredProcedure))
                    .ToList();
            }
            catch
            {
                return null;
            }
        }

        public async Task<List<spGetOrderByDescPriceOrderBookResult>> Get_BTC_USDT_BuyOrderBookAsync()
        {
            try
            {
                return (await _db.QueryAsync<spGetOrderByDescPriceOrderBookResult>(
                        $"Get_BTC_USDT_OrderBookBuy_OrderByDescPrice",
                        commandType: CommandType.StoredProcedure))
                    .ToList();
            }
            catch
            {
                return null;
            }
        }

        public async Task<List<spGetOrderByDescPriceOrderBookResult>> GetBuyOrderBookAsync(string sqlPairName)
        {
            try
            {
                return (await _db.QueryAsync<spGetOrderByDescPriceOrderBookResult>(
                        $"Get_{sqlPairName}_OrderBookBuy_OrderByDescPrice",
                        commandType: CommandType.StoredProcedure))
                    .ToList();
            }
            catch
            {
                return null;
            }
        }

        public async Task<int> GetCountOfClosedOrders()
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

        public async Task<List<ClosedOrderTableModel>> GetBTCUSDTClosedOrdersPaged(int page, int pageSize)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("page", page);
                p.Add("pageSize", pageSize);

                List<ClosedOrderTableModel> result =
                    (List<ClosedOrderTableModel>)await _db.QueryAsync<ClosedOrderTableModel>
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

        public async Task ClearAllBotsOrders()
        {
            var p = new DynamicParameters();
            await _db.QueryAsync("ClearAllBotsOrders", commandType: CommandType.StoredProcedure);
        }
    }
}