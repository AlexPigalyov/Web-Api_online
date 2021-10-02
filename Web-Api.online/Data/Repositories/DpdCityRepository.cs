using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public static class DpdCityRepository
    {
        public static async Task<dynamic> GetDPDCityAsync(string cityName)
        {
            using (var ctx = new webapionlineContext())
            {
                var top10cities = await ctx.DpdCities.FromSqlRaw($"EXEC [dbo].[spGetDPDCitiesTop10] @text = N'{cityName}'").ToListAsync();

                return top10cities;
            }
        }
    }
}
