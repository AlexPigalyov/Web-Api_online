using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class OutcomeTransactionRepository : IOutcomeTransactionRepository
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
                p.Add("id", outcomeTransaction.Id, dbType: DbType.Int64, direction: ParameterDirection.InputOutput);
                p.Add("fromWalletId", outcomeTransaction.FromWalletId);
                p.Add("toAddress", outcomeTransaction.ToAddress);
                p.Add("value", outcomeTransaction.Value);
                p.Add("platformCommission", outcomeTransaction.PlatformCommission);
                p.Add("fixedCommission", outcomeTransaction.FixedCommission);
                p.Add("blockchainCommission", outcomeTransaction.BlockchainCommission);
                p.Add("currencyAcronim", outcomeTransaction.CurrencyAcronim);
                p.Add("state", outcomeTransaction.State);

                await _db.ExecuteAsync("CreateOutcomeTransaction", p, commandType: CommandType.StoredProcedure);
                outcomeTransaction.Id = p.Get<long>("id");

                return outcomeTransaction;
            }
            catch (Exception ex) { return null; }
        }

        public async Task UpdateOutcomeTransactionAfterExecutionAsync(OutcomeTransactionTableModel outcomeTransaction)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("id", outcomeTransaction.Id);
                p.Add("state", outcomeTransaction.State);
                p.Add("blockchainCommission", outcomeTransaction.State);
                p.Add("transactionHash", outcomeTransaction.TransactionHash);
                p.Add("errorText", outcomeTransaction.ErrorText);

                await _db.QueryAsync("UpdateTransactionAfterExecution", p, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
            }
        }

        public async Task<List<OutcomeTransactionTableModel>> GetOutcomeTransactionsPaged(int page, int pageSize)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("page", page);
                p.Add("pageSize", pageSize);

                List<OutcomeTransactionTableModel> result =
                    (List<OutcomeTransactionTableModel>)await _db.QueryAsync<OutcomeTransactionTableModel>
                    ("GetOutcomeTransactions_Paged",
                        p,
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<List<spGetOutcomeTransactions_Paged>> GetPagedOutcomeTransactions(int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                List<spGetOutcomeTransactions_Paged> result =
                    (List<spGetOutcomeTransactions_Paged>)await _db.QueryAsync<spGetOutcomeTransactions_Paged>
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
