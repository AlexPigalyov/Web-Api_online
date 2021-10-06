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
using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Repositories
{
    public class RatesRepository : IRatesRepository
    {
        private readonly IConfiguration _configuration;

        public RatesRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<spGetLastRatesResult>> GetLastRatesAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                List<spGetLastRatesResult> result = (List<spGetLastRatesResult>)(await db.QueryAsync<spGetLastRatesResult>("exec GetLastRates"));

                return result;
            }
        }

        public async Task<List<spGetTickerRatesResult>> GetTickerInformationAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                List<spGetTickerRatesResult> result = (List<spGetTickerRatesResult>)(await db.QueryAsync<spGetTickerRatesResult>("exec GetTickerRates"));

                return result;
            }
        }

        public async Task<List<spGetLastCoinsRatesResult>> GetLastCoinsRatesAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                List<spGetLastCoinsRatesResult> result = (List<spGetLastCoinsRatesResult>)(await db.QueryAsync<spGetLastCoinsRatesResult>("exec GetLastCoinsRates"));

                return result;
            }
        }

        public async Task<List<spGetCoinRatesByAcronimResult>> GetCoinsByAcronimAsync(string acronim)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {

                List<spGetCoinRatesByAcronimResult> result = (List<spGetCoinRatesByAcronimResult>)(await db.QueryAsync<spGetCoinRatesByAcronimResult>("GetCoinRatesByAcronim",
                    new { acronim = acronim },
                    commandType: CommandType.StoredProcedure
                ));

                return result;
            }
        }

        public async Task<List<spGetCoinRatesByAcronimAndSiteResult>> GetCoinsByAcronimAndSiteAsync(string acronim, string site)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {

                List<spGetCoinRatesByAcronimAndSiteResult> result = (List<spGetCoinRatesByAcronimAndSiteResult>)(await db.QueryAsync<spGetCoinRatesByAcronimAndSiteResult>("GetCoinRatesByAcronimAndSite",
                    new
                    {
                        acronim = acronim,
                        site = site
                    },
                    commandType: CommandType.StoredProcedure
                ));

                return result;
            }
        }
    }
}
