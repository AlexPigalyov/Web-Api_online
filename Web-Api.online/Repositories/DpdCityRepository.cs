using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables.DPDCities;

namespace Web_Api.online.Repositories
{
    public static class DpdCityRepository
    {
        public static async Task<dynamic> GetDPDCityAsync(string cityName)
        {
            using (var ctx = new webapionlineContext())
            {
                var top10cities = await ctx.DpdCities.FromSqlRaw($"spDPDCitiesTop10 '{cityName}'").ToListAsync();

                return top10cities;
            }
        }
    }
}
