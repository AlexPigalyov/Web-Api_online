using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class TransferRepository
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnection _db;

        public TransferRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection"));            
        }

        public async Task<TransferTableModel> CreateUserIncomeWalletAsync(TransferTableModel transfer)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("walletFromId", transfer.WalletFromId);
                p.Add("walletToId", transfer.WalletToId);
                p.Add("value", transfer.Value);
                p.Add("currensyAcronim", transfer.CurrencyAcronim);
                p.Add("hash", transfer.Hash);
                p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                await _db.QueryAsync<int>("CreateTransfer", p, commandType: CommandType.StoredProcedure);

                transfer.Id = p.Get<int>("new_identity");

                return transfer;
            }
            catch (Exception ex) { return null; }
        }
    }
}
