using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class NewsRepository : INewsRepository
    {
        private readonly IDbConnection _db;
        public NewsRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
        }

        public async Task<List<spGetNews>> GetNews()
        {
            try
            {
                return (await _db.QueryAsync<spGetNews>(
                        "GetNews",
                        commandType: CommandType.StoredProcedure)).ToList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public async Task UpdateSetting(spUpdateSettingArgs model) 
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("name", model.Name);
                parameters.Add("value", model.Value);

                await _db.ExecuteAsync(
                    "UpdateSetting",
                    parameters,
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception exc)
            {
                
            }
        }

        public async Task CreateSetting(SettingTableModel model)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("name", model.Name);
                parameters.Add("value", model.Value);

                await _db.ExecuteAsync(
                    "CreateSetting",
                    parameters,
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception exc)
            {

            }
        }
    }
}
