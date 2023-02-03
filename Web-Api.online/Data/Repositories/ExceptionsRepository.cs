using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Web_Api.online.Models.Tables;
using Web_Api.online.Data.Repositories.Abstract;

namespace Web_Api.online.Data.Repositories
{
    public class ExceptionsRepository : IExceptionsRepository
    {
        private readonly IDbConnection _db;
        public ExceptionsRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<List<ExceptionTableModel>> GetTop10000ExceptionsAsync()
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

        public async Task CreateExceptionAsync(Exception exception)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("value", exception.Message);
                p.Add("stackTrace", exception.StackTrace);
                p.Add("userId", null);

                await _db.QueryAsync<int>("CreateException", p, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { return; }
        }

        public async Task CreateExceptionAsync(ExceptionTableModel exception)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("value", exception.Value);
                p.Add("stackTrace", exception.StackTrace);
                p.Add("userId", exception.UserId);

                await _db.QueryAsync<int>("CreateException", p, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { return; }
        }

    }
}