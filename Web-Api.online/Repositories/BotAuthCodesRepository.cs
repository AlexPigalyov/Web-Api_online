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
    public class BotAuthCodesRepository
    {
        private readonly IConfiguration _configuration;

        public BotAuthCodesRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task CreateBotAuthCode(Args_spCreateBotAuthCode model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                await db.ExecuteAsync(
                    "spCreateBotAuthCode",
                    new
                    {
                        botAuthCode = model.BotAuthCode,
                        userId = model.UserId
                    },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task DeleteBotAuthCodeById(string id)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                await db.ExecuteAsync(
                    "spDeleteBotAuthCode_ById",
                    new
                    {
                        id = id
                    },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<BotAuthCodes>> GetBotAuthCodesByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                List<BotAuthCodes> result = (List<BotAuthCodes>)
                    await db.QueryAsync<BotAuthCodes>(
                        "spGetBotAuthCodes_ById",
                        new { userid = userId },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }

        public async Task<BotAuthCodes> GetBotAuthCodeByBotAuthCode(string botAuthCode)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                BotAuthCodes result = await db.QueryFirstAsync<BotAuthCodes>(
                        "spGetBotAuthCode_ByBotAuthCode",
                        new { botAuthCode = botAuthCode },
                        commandType: CommandType.StoredProcedure);

                return result;
            }
        }
    }
}
