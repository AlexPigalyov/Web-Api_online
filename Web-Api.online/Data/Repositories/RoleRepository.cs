using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.StoredProcedures;

namespace Web_Api.online.Data.Repositories
{
    
    public class RoleRepository
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnection _db;
        public RoleRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
        }

        public async Task<List<spGetRolesForAdminPanelResult>> GetRolesForAdminPanelAsync(int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _db.QueryAsync<spGetRolesForAdminPanelResult>(
                        "GetRolesForAdminPanel",
                        parameters,
                        commandType: CommandType.StoredProcedure)).AsList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }
    }
}
