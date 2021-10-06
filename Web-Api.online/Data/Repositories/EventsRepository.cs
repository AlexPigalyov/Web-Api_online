using Dapper;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class EventsRepository
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnection _db;
        public EventsRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection"));            
        }

        public async Task<List<EventTableModel>> spGetLastThreeEvents_ByUserId(string userId)
        {
            List<EventTableModel> result = (List<EventTableModel>)
                await _db.QueryAsync<EventTableModel>(
                    "GetLastThreeEvents_ByUserId",
                    new { userId = userId },
                    commandType: CommandType.StoredProcedure);

            return result;

        }

        public async Task CreateEvent(EventTableModel model)
        {
            await _db.ExecuteAsync(
                "CreateEvent",
                new
                {
                    userid = model.UserId,
                    type = model.Type,
                    value = model.Value,
                    comment = model.Comment,
                    whenDate = model.WhenDate,
                    currencyAcronim = model.CurrencyAcronim,
                },
                commandType: CommandType.StoredProcedure);
        }

        public async Task<List<EventTableModel>> GetByUserId(string userId)
        {
            List<EventTableModel> result = (List<EventTableModel>)
                await _db.QueryAsync<EventTableModel>(
                    "GetEventsByUserIdWithOrderByDescWhenDate",
                    new { userId = userId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }
    }
}