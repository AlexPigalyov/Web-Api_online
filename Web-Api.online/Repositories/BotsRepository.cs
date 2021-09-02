using Dapper;

using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public class BotsRepository
    {
        private readonly IConfiguration _configuration;

        public BotsRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task CreateBot(Args_spCreateBot model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                await db.ExecuteAsync(
                    "spCreateBot",
                    new
                    {
                        name = model.Name,
                        botAuthCode = model.BotAuthCode,
                        userId = model.UserId
                    },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task DeleteBotById(string id)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                await db.ExecuteAsync(
                    "spDeleteBots_ById",
                    new
                    {
                        id = id
                    },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<Bots>> GetBotByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                List<Bots> result = (List<Bots>)
                    await db.QueryAsync<Bots>(
                        "spGetBots_ById",
                        new { userid = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }

        public async Task<Bots> GetBotByBotAuthCode(string botAuthCode)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                Bots result = await db.QueryFirstAsync<Bots>(
                        "spGetBots_ByBotAuthCode",
                        new { botAuthCode = botAuthCode },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }
    }
}
