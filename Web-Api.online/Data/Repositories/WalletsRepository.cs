using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using Web_Api.online.Data;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using System;

namespace Web_Api.online.Data.Repositories
{
    public class WalletsRepository
    {
        private readonly IDbConnection _db;
        public WalletsRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }

        public async Task<List<WalletTableModel>> GetUserWalletsAsync(string userId)
        {
            try
            {
                List<WalletTableModel> result = (List<WalletTableModel>)await _db.QueryAsync<WalletTableModel>(
                    "GetUserWallets",
                    new { userId = userId },
                    commandType: CommandType.StoredProcedure
            );

                return result;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<WalletTableModel> GetUserWalletAsync(string userId, string acronim)
        {
            try
            {
                WalletTableModel result = ((List<WalletTableModel>)await _db.QueryAsync<WalletTableModel>("GetUserWalletByAcronim",
                new
                {
                    userId = userId,
                    acronim = acronim
                },
                commandType: CommandType.StoredProcedure
            )).FirstOrDefault();

                return result;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<List<IncomeWalletTableModel>> GetUserIncomeWalletsAsync(string userId)
        {
            try
            {
                List<IncomeWalletTableModel> result = (List<IncomeWalletTableModel>)(await _db.QueryAsync<IncomeWalletTableModel>("GetUserIncomeWallets",
                new { userId = userId },
                commandType: CommandType.StoredProcedure
            ));

                return result;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<List<IncomeWalletTableModel>> GetUserIncomeWalletsByAcronimAsync(string userId, string acronim)
        {
            try
            {
                List<IncomeWalletTableModel> result = (List<IncomeWalletTableModel>)(await _db.QueryAsync<IncomeWalletTableModel>("GetUserIncomeWalletByAcronim",
                new { userId = userId },
                commandType: CommandType.StoredProcedure
            ));

                return result;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<IncomeWalletTableModel> CreateUserIncomeWalletAsync(IncomeWalletTableModel wallet)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("userId", wallet.UserId);
                p.Add("address", wallet.Address);
                p.Add("addressLabel", wallet.AddressLabel);
                p.Add("currencyAcronim", wallet.CurrencyAcronim);
                p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                await _db.QueryAsync<int>("CreateUserIncomeWallet", p, commandType: CommandType.StoredProcedure);

                wallet.Id = p.Get<int>("new_identity");

                return wallet;
            }
            catch (Exception ex) { return null; }
        }

        public async Task<WalletTableModel> CreateUserWalletAsync(WalletTableModel wallet)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("userId", wallet.UserId);
                p.Add("address", wallet.Address);
                p.Add("currencyAcronim", wallet.CurrencyAcronim);
                p.Add("value", wallet.Value);
                p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                await _db.QueryAsync<int>("CreateUserWallet", p, commandType: CommandType.StoredProcedure);

                wallet.Id = p.Get<int>("new_identity");

                return wallet;
            }
            catch (Exception ex) { return null; }
        }

        public async Task UpdateWalletBalanceAsync(WalletTableModel wallet)
        {
            try
            {
                await _db.ExecuteAsync("UpdateWalletBalance",
                    new
                    {
                        walletId = wallet.Id,
                        newWalletBalance = wallet.Value
                    },
                    commandType: CommandType.StoredProcedure);

            }
            catch (Exception ex) { return; }
        }

        public async Task UpdateUserWalletBalanceAsync(int walletId, decimal addValue)
        {
            try
            {
                await _db.ExecuteAsync("UpdateUserWalletBalance",
                    new
                    {
                        walletId = walletId,
                        addWalletBalance = addValue
                    },
                    commandType: CommandType.StoredProcedure);

            }
            catch (Exception ex) { return; }
        }

        public async Task<List<spGetNotEmptyValueWallet_ByUserIdResult>> GetNotEmptyWalletsByUserIdAsync(string userId)
        {
            try
            {
                return (await _db.QueryAsync<spGetNotEmptyValueWallet_ByUserIdResult>("GetNotEmptyValueWallet_ByUserId",
                    new
                    {
                        userid = userId
                    },
                    commandType: CommandType.StoredProcedure))
                    .ToList();

            }
            catch (Exception ex) { return null; }
        }

        public async Task SendCoinsAsync(SendCoinsModel sendCoins)
        {
            try
            {
                await _db.ExecuteAsync("SendCoins",
                    new
                    {
                        senderUserId = sendCoins.SenderUserId,
                        receiverUserId = sendCoins.ReceiverUserId,
                        typeSend = sendCoins.TypeSender,
                        typeRecieve = sendCoins.TypeRecieve,

                        comment = sendCoins.Comment,
                        currencyAcronim = sendCoins.CurrencyAcronim,
                        value = sendCoins.Value,
                        platformCommission = sendCoins.PlatformCommission,

                        startBalanceSender = sendCoins.StartBalanceSender,
                        resultBalanceSender = sendCoins.ResultBalanceSender,
                        startBalanceReceiver = sendCoins.StartBalanceReceiver,
                        resultBalanceReceiver = sendCoins.ResultBalanceReceiver,

                        senderWalletId = sendCoins.SenderWalletId,
                        receiverWalletId = sendCoins.ReceiverWalletId,
                        hash = sendCoins.Hash
                    },
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { return; }
        }

        public async Task<List<CurrencyTableModel>> GetCurrenciesAsync()
        {
            using (var ctx = new ExchangeContext())
            {
                try
                {
                    var currencies = await ctx.Currencies.ToListAsync();

                    return currencies;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<CurrencyTableModel> GetCurrencyByAcronimAsync(string acronim)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("acronim", acronim);

                return (await _db.QueryFirstOrDefaultAsync<CurrencyTableModel>(
                        "GetCurrencyByAcronim",
                        parameters,
                        commandType: CommandType.StoredProcedure));
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public async Task<string> GetUserIdByWalletAddress(string address)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("address", address);

                return (await _db.QueryAsync<string>(
                        "GetUserIdByWalletAddress",
                        parameters,
                        commandType: CommandType.StoredProcedure)).FirstOrDefault();
            }
            catch (Exception exc)
            {
                return null;
            }
        }
    }
}
