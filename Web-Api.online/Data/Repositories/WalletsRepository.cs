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

        public async Task<List<spGetNotEmptyValueWallet_ByUserIdResult>> GetNotEmptyWalletsByUserId(string userId)
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

        public async Task SendCoinsAync(SendCoinsModel sendCoinsModel)
        {
            try
            {
                await _db.ExecuteAsync("SendCoins",
                    new
                    {
                        senderUserId = sendCoinsModel.EventSender.UserId,
                        receiverUserId = sendCoinsModel.EventReceiver.UserId,
                        typeSend = sendCoinsModel.EventSender.Type,
                        typeRecieve = sendCoinsModel.EventReceiver.Type,

                        comment = sendCoinsModel.EventSender.Comment,
                        currencyAcronim = sendCoinsModel.EventSender.CurrencyAcronim,
                        value = sendCoinsModel.EventSender.Value,

                        senderWalletId = sendCoinsModel.Transfer.WalletFromId,
                        receiverWalletId = sendCoinsModel.Transfer.WalletToId,
                        hash = sendCoinsModel.Transfer.Hash
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
    }
}
