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
    public class RatesRepository : IRatesRepository
    {
        private readonly IConfiguration _configuration;

        public RatesRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public Rate GetLastRates()
        {
            using (var ctx = new webapionlineContext())
            {
                return ctx.Rates.OrderByDescending(item => item.Id).FirstOrDefault();
            }
        }

        public async Task<List<spGetTickerRatesResult>> GetTickerInformationAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                List<spGetTickerRatesResult> result = (List<spGetTickerRatesResult>)(await db.QueryAsync<spGetTickerRatesResult>("exec spGetTickerRates"));

                return result;
            }
        }

        public async Task<List<spGetLastCoinsRatesResult>> GetLastCoinsRatesAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                List<spGetLastCoinsRatesResult> result = (List<spGetLastCoinsRatesResult>)(await db.QueryAsync<spGetLastCoinsRatesResult>("exec spGetLastCoinsRates"));

                return result;
            }
        }

        public async Task<List<spGetCoinRatesByAcronimResult>> GetCoinsByAcronimAsync(string acronim)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {

                List<spGetCoinRatesByAcronimResult> result = (List<spGetCoinRatesByAcronimResult>)(await db.QueryAsync<spGetCoinRatesByAcronimResult>("spGetCoinRatesByAcronim",
                    new { acronim = acronim },
                    commandType: CommandType.StoredProcedure
                ));

                return result;
            }
        }
    }
}
