using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using Nethereum.Util;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class CandleStickRepository
    {
        private readonly IDbConnection _db;

        public CandleStickRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task CreateCandleStick(string pairName, CandleStickTableModel candleStick)
        {
            try
            {
                /*
                var p = new DynamicParameters();
                p.Add("pairName", pairName);
                p.Add("close", candleStick.Close);
                p.Add("closeTime", candleStick.CloseTime.ToString());
                p.Add("high", candleStick.High);
                p.Add("low", candleStick.Low);
                p.Add("open", candleStick.Open);
                p.Add("openTime", candleStick.OpenTime.ToString());

                await _db.ExecuteAsync("CreateCandleStick", p, commandType: CommandType.StoredProcedure);*/

                var query =
                    $"INSERT INTO [Exchange].[dbo].[{pairName}_CandleStick] ([Close], CloseTime, High, Low, [Open], OpenTime) " +
                    $"VALUES ({candleStick.Close.ToStringInvariant()}, '{candleStick.CloseTime}', {candleStick.High.ToStringInvariant()}, {candleStick.Low.ToStringInvariant()}, {candleStick.Open.ToStringInvariant()}, '{candleStick.OpenTime.ToStringInvariant()}')";

                await _db.ExecuteAsync(query);
            }
            catch (Exception ex) { }
        }

        public async Task<CandleStickTableModel> GetLastCandleStick(string pairName)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("pairName", pairName);

                var candleStick = await _db
                    .QueryFirstAsync<CandleStickTableModel>("GetLastCandleStick", p, commandType: CommandType.StoredProcedure);

                return candleStick;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<List<ClosedOrderTableModel>> GetLastOrdersBySeconds(string pairName, string seconds)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("pairName", pairName);
                p.Add("seconds", seconds);

                var orders = await _db
                    .QueryAsync<ClosedOrderTableModel>("GetLastOrdersBySeconds", p, commandType: CommandType.StoredProcedure);

                return orders.ToList();
            }
            catch (Exception ex) { return null; }
        }

        public async Task<List<CandleStickTableModel>> Get_BTC_USDT_CandleSticks(GetCandleStickModel model)
        {
            try
            {
                if (model.Interval == null) model.Interval = "1h";

                var p = new DynamicParameters();
                p.Add("datestart", model.DateStart);
                p.Add("dateend", model.DateEnd);
                p.Add("interval", model.Interval);

                return (await _db.QueryAsync<CandleStickTableModel>("Get_BTC_USDT_CandleStick", p, commandType: CommandType.StoredProcedure))
                    .ToList();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<CandleStickTableModel> GetCurrent_BTC_USDT_CandleStick()
        {
            try
            {
                return await _db.QueryFirstAsync<CandleStickTableModel>(
                    "GetCurrent_BTC_USDT_CandleStick",
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task spProcess_BTC_USDT_CandleStick()
        {
            try
            {
                await _db.ExecuteAsync("Process_BTC_USDT_CandleStick", commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { }
        }

        public async Task spCreate_BTC_USDT_CandleStick(CandleStickTableModel candleStick)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("close", candleStick.Close);
                p.Add("closeTime", candleStick.CloseTime);
                p.Add("high", candleStick.High);
                p.Add("low", candleStick.Low);
                p.Add("open", candleStick.Open);
                p.Add("openTime", candleStick.OpenTime);

                await _db.ExecuteAsync("Create_BTC_USDT_CandleStick", p, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { }
        }
    }
}
