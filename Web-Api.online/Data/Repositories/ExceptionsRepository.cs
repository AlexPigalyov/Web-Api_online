using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class ExceptionsRepository
    {
        private readonly IDbConnection _db;
        public ExceptionsRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<List<ExceptionTableModel>> GetTop10000Exceptions()
        {
            try
            {
                return (await _db.QueryAsync<ExceptionTableModel>("Get_Top10000_Exceptions",
                    commandType: CommandType.StoredProcedure)).AsList();
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}