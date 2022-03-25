using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class PairsRepository
    {
        private readonly IDbConnection _db;

        public PairsRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<List<PairsTableModel>> GetAllPairsAsync()
        {

            List<PairsTableModel> result = (List<PairsTableModel>)await _db.QueryAsync<PairsTableModel>("GetAllPairs", commandType: CommandType.StoredProcedure);

            return result;
        }
    }
}
