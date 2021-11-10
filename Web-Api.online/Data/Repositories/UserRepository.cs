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
        private readonly IDbConnection _db;
        public UserRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
        }
        public async Task<List<spGetUsers_PagedSettings>> GetPagedUsers(int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _db.QueryAsync<spGetUsers_PagedSettings>(
                        "GetUsers_Paged",
                        parameters,
                        commandType: CommandType.StoredProcedure)).ToList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public async Task<List<spGetUsers_PagedSettings>> FindPagedUsersByUsername(string userName, int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("userName", userName);
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _db.QueryAsync<spGetUsers_PagedSettings>(
                        "FindUsersByUsername_Paged",
                        parameters,
                        commandType: CommandType.StoredProcedure)).AsList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public async Task<string> FindUserIdForSendPageAsync(string searchText)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("searchText", searchText);

                return (await _db.QueryAsync<string>(
                        "FindUserIdForSendPage",
                        parameters,
                        commandType: CommandType.StoredProcedure)).FirstOrDefault();
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
            catch (Exception exc)
            {
                return 0;
            }
        }
    }
}
