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
        private readonly IDbConnection _db;
        public RoleRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
        }

        public async Task<List<spGetRoles_Paged>> GetPagedRoles(int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _db.QueryAsync<spGetRoles_Paged>(
                        "GetRoles_Paged",
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
