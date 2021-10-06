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
using Web_Api.online.Data.Repositories.Abstract;

namespace Web_Api.online.Data.Repositories
{
    public class RatesRepository : IRatesRepository
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnection _db;

        public RatesRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));            
        }

        public async Task<List<spGetLastRatesResult>> GetLastRatesAsync()
        {
            List<spGetLastRatesResult> result =
                (List<spGetLastRatesResult>)await _db.QueryAsync<spGetLastRatesResult>("exec GetLastRates");

            return result;
        }

        public async Task<List<spGetTickerRatesResult>> GetTickerInformationAsync()
        {
            List<spGetTickerRatesResult> result =
                (List<spGetTickerRatesResult>)await _db.QueryAsync<spGetTickerRatesResult>("exec GetTickerRates");

            return result;
        }

        public async Task<List<spGetLastCoinsRatesResult>> GetLastCoinsRatesAsync()
        {
            List<spGetLastCoinsRatesResult> result =
                (List<spGetLastCoinsRatesResult>)await _db.QueryAsync<spGetLastCoinsRatesResult>("exec GetLastCoinsRates");

            return result;
        }

        public async Task<List<spGetCoinRatesByAcronimResult>> GetCoinsByAcronimAsync(string acronim)
        {
            List<spGetCoinRatesByAcronimResult> result =
                (List<spGetCoinRatesByAcronimResult>)await _db.QueryAsync<spGetCoinRatesByAcronimResult>("GetCoinRatesByAcronim",
                    new { acronim = acronim },
                    commandType: CommandType.StoredProcedure
                );

            return result;
        }

        public async Task<List<spGetCoinRatesByAcronimAndSiteResult>> GetCoinsByAcronimAndSiteAsync(string acronim, string site)
        {
            List<spGetCoinRatesByAcronimAndSiteResult> result = (List<spGetCoinRatesByAcronimAndSiteResult>)
                await _db.QueryAsync<spGetCoinRatesByAcronimAndSiteResult>("GetCoinRatesByAcronimAndSite",
                new
                {
                    acronim = acronim,
                    site = site
                },
                commandType: CommandType.StoredProcedure
            );

            return result;
        }
    }
}
