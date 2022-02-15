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
    public class TransferRepository
    {
        private readonly IDbConnection _db;

        public TransferRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<List<TransferTableModel>> GetTop10000Transfers()
        {
            try
            {
                return (await _db.QueryAsync<TransferTableModel>("Get_Top10000_Transfers", commandType: CommandType.StoredProcedure)).AsList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }


        public async Task<List<TransferTableModel>> GetAllTransfers()
        {
            try
            {
                List<TransferTableModel> result =
                    (List<TransferTableModel>)await _db.QueryAsync<TransferTableModel>
                    ("GetAllTransfers",
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<List<TransferTableModel>> GetTransfersPaged(int page, int pageSize)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("page", page);
                p.Add("pageSize", pageSize);

                List<TransferTableModel> result =
                    (List<TransferTableModel>)await _db.QueryAsync<TransferTableModel>
                    ("GetTransfers_Paged",
                        p,
                        commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<TransferTableModel> CreateTransferAsync(TransferTableModel transfer)
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
