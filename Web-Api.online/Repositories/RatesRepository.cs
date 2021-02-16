using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables;
using Microsoft.Extensions.Configuration;

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

        public async Task<dynamic> GetTickerInformationAsync()
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaulConnection")))
            {
                var result = await db.QueryAsync<dynamic>("exec spGetTickerRates");

                return result;
            }
        }
    }
}
