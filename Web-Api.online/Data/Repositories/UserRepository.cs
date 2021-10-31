using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Models;

namespace Web_Api.online.Data.Repositories
{
    public class UserRepository
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnection _db;
        public UserRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
        }
        public async Task<List<spGetUsersForAdminPanelResult>> GetUsersForAdminPanelAsync(int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _db.QueryAsync<spGetUsersForAdminPanelResult>(
                        "GetUsersForAdminPanel",
                        parameters,
                        commandType: CommandType.StoredProcedure)).ToList();
            } 
            catch(Exception exc)
            {
                return null;
            }            
        }

        public async Task<List<spGetUsersForAdminPanelResult>> FindUsersByUsernameForAdminPanel(string userName, int page, int pageSize) 
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("userName", userName);
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _db.QueryAsync<spGetUsersForAdminPanelResult>(
                        "FindUsersByUsernameForAdminPanel",
                        parameters,
                        commandType: CommandType.StoredProcedure)).AsList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public async Task<int> GetCountOfUsers()
        {
            try
            {
                return await _db.QueryFirstAsync<int>(
                    "GetCountOfUsers",
                    commandType: CommandType.StoredProcedure);
            }
            catch(Exception exc)
            {
                return 0;
            }
        }
    }
}
