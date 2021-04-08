using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public interface IRatesRepository
    {
        public Task<List<spGetLastRatesResult>> GetLastRatesAsync();

        public Task<List<spGetTickerRatesResult>> GetTickerInformationAsync();

        public Task<List<spGetLastCoinsRatesResult>> GetLastCoinsRatesAsync();

        public Task<List<spGetCoinRatesByAcronimResult>> GetCoinsByAcronimAsync(string acronim);

        public Task<List<spGetCoinRatesByAcronimAndSiteResult>> GetCoinsByAcronimAndSiteAsync(string acronim, string site);
    }
}
