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
        private readonly IDbConnection _db;
        public EventsRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<List<EventTableModel>> GetLastThreeEvents_ByUserId(string userId)
        {
            List<EventTableModel> result = (List<EventTableModel>)
                await _db.QueryAsync<EventTableModel>(
                    "GetLastThreeEvents_ByUserId",
                    new { userId = userId },
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task CreateEventAsync(EventTableModel model)
        {
            await _db.ExecuteAsync(
                "CreateEvent",
                new
                {
                    userid = model.UserId,
                    type = model.Type,
                    value = model.Value,
                    startBalance = model.StartBalance,
                    resultBalance = model.ResultBalance,
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