using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using System;

namespace Web_Api.online.Repositories
{
    public class WalletsRepository
    {
        private readonly IConfiguration _configuration;

        public WalletsRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<Wallet>> GetUserWalletsAsync(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    List<Wallet> result = (List<Wallet>)(await db.QueryAsync<Wallet>("spGetUserWallets",
                    new { userId = userId },
                    commandType: CommandType.StoredProcedure
                ));

                    return result;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<Wallet> CreateUserWalletsAsync(Wallet wallet)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("userId", wallet.UserId);
                    p.Add("walletAddress", wallet.WalletAddress);
                    p.Add("currencyAcronim", wallet.CurrencyAcronim);
                    p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    await db.QueryAsync<int>("spCreateUserWallet", p, commandType: CommandType.StoredProcedure);

                    wallet.Id = p.Get<int>("new_identity");

                    return wallet;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<List<Currency>> GetCurrenciesAsync()
        {
            using (var ctx = new exchangeContext())
            {
                try
                {
                    var currencies = await ctx.Currencies.ToListAsync();

                    return currencies;
                }
                catch (Exception ex) { return null; }
            }
        }
    }
}
