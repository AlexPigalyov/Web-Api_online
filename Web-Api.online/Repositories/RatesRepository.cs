using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public static class RatesRepository
    {
        public static Rate GetLastRates()
        {
            using (var ctx = new webapionlineContext())
            {
                return ctx.Rates.OrderByDescending(item => item.Id).FirstOrDefault();
            }
        }

        public static async Task<List<Rate>> GetTickerInformationAsync()
        {
            using (var ctx = new webapionlineContext())
            {
                var tickerInformation = await ctx.Rates.FromSqlRaw($"spGetTickerRates").ToListAsync();

                return tickerInformation;
            }
        }
    }
}
