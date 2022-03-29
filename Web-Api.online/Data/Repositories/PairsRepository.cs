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

        private async Task CreatePairRow(string firstCurrency, string secondCurrency)
        {
            var parameters = new DynamicParameters();
            parameters.Add("currency1", firstCurrency);
            parameters.Add("currency2", secondCurrency);
            parameters.Add("created", DateTime.Now);
            parameters.Add("header", firstCurrency + " - " + secondCurrency);
            parameters.Add("acronim", firstCurrency + secondCurrency);

            await _db.ExecuteAsync("CreatePair", parameters, commandType: CommandType.StoredProcedure);
        }
        
        public async Task Create(string firstCurrency, string secondCurrency)
        {
            await CreatePairRow(firstCurrency, secondCurrency);
            
            var x = Directory.GetDirectories("Data\\Templates");
            foreach (var fullname in Directory.GetDirectories("Data\\Templates").OrderByDescending(x => x))
            {
                foreach (var file in Directory.GetFiles(fullname))
                {
                    await _db
                        .ExecuteAsync((await File.ReadAllTextAsync(file))
                            .Replace("{cryptocurrencypair}", firstCurrency + "_" + secondCurrency));
                }
            }
                
        }
    
    }
}
