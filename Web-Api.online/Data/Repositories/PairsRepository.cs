using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
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

            List<PairsTableModel> result =
                (List<PairsTableModel>) await _db.QueryAsync<PairsTableModel>("GetAllPairs",
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task Create(string cryptExchangePairName)
        {
            var x = Directory.GetDirectories("Data\\Templates");
            foreach (var fullname in Directory.GetDirectories("Data\\Templates").OrderByDescending(x => x))
            {
                foreach (var file in Directory.GetFiles(fullname))
                {
                    await _db
                        .ExecuteAsync((await File.ReadAllTextAsync(file))
                            .Replace("{cryptocurrencypair}", cryptExchangePairName));
                }
            }
                
        }
    
    }
}
