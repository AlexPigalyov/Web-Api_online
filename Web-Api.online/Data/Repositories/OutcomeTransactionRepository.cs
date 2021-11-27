using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class OutcomeTransactionRepository
    {
        private readonly IDbConnection _db;
        public OutcomeTransactionRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<OutcomeTransactionTableModel> CreateOutcomeTransaction(OutcomeTransactionTableModel outcomeTransaction)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("fromAdress", outcomeTransaction.Id);
                p.Add("toAdress", outcomeTransaction.Id);
                p.Add("value", outcomeTransaction.Id);
                p.Add("currencyAcronim", outcomeTransaction.Id);
                p.Add("state", outcomeTransaction.Id);
                p.Add("errorText", outcomeTransaction.State);

                await _db.QueryFirstAsync("CreateOutcomeTransaction", p, commandType: CommandType.StoredProcedure);
                outcomeTransaction.Id = p.Get<int>("new_identity");
                return outcomeTransaction;  
            }
            catch (Exception ex) { return null; }
        }
        
        public async Task<List<spGetOutcomeTransactions_Paged>> GetPagedOutcomeTransactions(int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                List<spGetOutcomeTransactions_Paged> result =
                    (List<spGetOutcomeTransactions_Paged>) await _db.QueryAsync<spGetOutcomeTransactions_Paged>
                    ("GetOutcomeTransactions_Paged",
                        parameters,
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<int> GetCountOfOutcomeTransactions()
        {
            try
            {
                return await _db.QueryFirstAsync<int>(
                    "GetCountOfOutcomeTransactions",
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception exc)
            {
                return 0;
            }
        }
    }
}
