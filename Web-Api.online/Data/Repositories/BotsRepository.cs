using Dapper;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class BotsRepository
    {
        private readonly IDbConnection _db;
        private readonly IConfiguration _configuration;

        public BotsRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection"));           
        }

        public async Task CreateBot(BotsTableModel model)
        {
            await _db.ExecuteAsync(
                "CreateBot",
                new
                {
                    name = model.Name,
                    botAuthCode = model.BotAuthCode,
                    userId = model.UserId
                },
                commandType: CommandType.StoredProcedure);
        }

        public async Task DeleteBotById(string id)
        {
            await _db.ExecuteAsync(
                "DeleteBots_ById",
                new
                {
                    id = id
                },
                commandType: CommandType.StoredProcedure);
        }

        public async Task<List<BotsTableModel>> GetBotByUserId(string userId)
        {
            List<BotsTableModel> result = (List<BotsTableModel>)
                await _db.QueryAsync<BotsTableModel>(
                    "GetBots_ById",
                    new { userid = userId },
                    commandType: CommandType.StoredProcedure);

            return result;

        }

        public async Task<BotsTableModel> GetBotByBotAuthCode(string botAuthCode)
        {
            BotsTableModel result = await _db.QueryFirstAsync<BotsTableModel>(
                    "GetBots_ByBotAuthCode",
                    new { botAuthCode = botAuthCode },
                    commandType: CommandType.StoredProcedure);

            return result;
        }
    }
}

