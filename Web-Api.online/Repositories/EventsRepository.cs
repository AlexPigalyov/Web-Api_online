using Dapper;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public class EventsRepository
    {
        private readonly IConfiguration _configuration;

        public EventsRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task AddEvent(Events model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                await db.ExecuteAsync(
                    "spAddEvent",
                    new
                    {
                        userid = model.UserId,
                        type = model.Type,
                        value = model.Value,
                        comment = model.Comment,
                        whenDate = model.WhenDate
                    },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<Events>> GetByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                List<Events> result = (List<Events>)
                    await db.QueryAsync<Events>(
                        "spGetEventsByUserIdWithOrderByDescWhenDate",
                        new { userId = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }
    }
}