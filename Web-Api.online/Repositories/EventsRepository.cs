﻿using Dapper;

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

        public async Task<List<EventTableModel>> spGetLastThreeEvents_ByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                List<EventTableModel> result = (List<EventTableModel>)
                    await db.QueryAsync<EventTableModel>(
                        "spGetLastThreeEvents_ByUserId",
                        new { userId = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }

        public async Task CreateEvent(EventTableModel model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                await db.ExecuteAsync(
                    "spCreateEvent",
                    new
                    {
                        userid = model.UserId,
                        type = model.Type,
                        value = model.Value,
                        comment = model.Comment,
                        whenDate = model.WhenDate,
                        currencyAcronim = model.CurrencyAcronim ,
                    },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<EventTableModel>> GetByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                List<EventTableModel> result = (List<EventTableModel>)
                    await db.QueryAsync<EventTableModel>(
                        "spGetEventsByUserIdWithOrderByDescWhenDate",
                        new { userId = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }
    }
}