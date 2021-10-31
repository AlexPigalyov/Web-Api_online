using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class OutcomeTransactionRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDbConnection db;
        public OutcomeTransactionRepository(IConfiguration configuration)
        {
            this.configuration = configuration;
            db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task CreateOutcomeTransaction(OutcomeTransactionTableModel outcomeTransaction)
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

                await db.QueryAsync("CreateOutcomeTransaction", p, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { }
        }
    }
}
