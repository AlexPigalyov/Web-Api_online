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

namespace Web_Api.online.Repositories
{
    public class WalletsRepository
    {
        private readonly IConfiguration _configuration;

        public WalletsRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<WalletTableModel>> GetUserWalletsAsync(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    List<WalletTableModel> result = (List<WalletTableModel>)(await db.QueryAsync<WalletTableModel>("GetUserWallets",
                    new { userId = userId },
                    commandType: CommandType.StoredProcedure
                ));

                    return result;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<WalletTableModel> GetUserWalletAsync(string userId, string acronim)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    WalletTableModel result = await db.QueryFirstOrDefaultAsync<WalletTableModel>("GetUserWalletByAcronim",
                    new
                    {
                        userId = userId,
                        acronim = acronim
                    },
                    commandType: CommandType.StoredProcedure
                );

                    return result;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<List<IncomeWallet>> GetUserIncomeWalletsAsync(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    List<IncomeWallet> result = (List<IncomeWallet>)(await db.QueryAsync<IncomeWallet>("GetUserIncomeWallets",
                    new { userId = userId },
                    commandType: CommandType.StoredProcedure
                ));

                    return result;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<IncomeWallet> CreateUserIncomeWalletAsync(IncomeWallet wallet)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("userId", wallet.UserId);
                    p.Add("address", wallet.Address);
                    p.Add("addressLabel", wallet.AddressLabel);
                    p.Add("currencyAcronim", wallet.CurrencyAcronim);
                    p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    await db.QueryAsync<int>("CreateUserIncomeWallet", p, commandType: CommandType.StoredProcedure);

                    wallet.Id = p.Get<int>("new_identity");

                    return wallet;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<WalletTableModel> CreateUserWalletAsync(WalletTableModel wallet)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("userId", wallet.UserId);
                    p.Add("address", wallet.Address);
                    p.Add("currencyAcronim", wallet.CurrencyAcronim);
                    p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    await db.QueryAsync<int>("CreateUserWallet", p, commandType: CommandType.StoredProcedure);

                    wallet.Id = p.Get<int>("new_identity");

                    return wallet;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task UpdateWalletBalance(WalletTableModel wallet)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    await db.QueryAsync<WalletTableModel>("UpdateWalletBalance",
                        new
                        {
                            walletId = wallet.Id,
                            newWalletBalance = wallet.Value
                        },
                              commandType: CommandType.StoredProcedure);

                }
                catch (Exception ex) { return; }
            }
        }

        public async Task<List<spGetNotEmptyValueWallet_ByUserId>> GetNotEmptyWalletsByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    return (await db.QueryAsync<spGetNotEmptyValueWallet_ByUserId>("GetNotEmptyValueWallet_ByUserId",
                        new
                        {
                            userid = userId
                        },
                        commandType: CommandType.StoredProcedure))
                        .ToList();

                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task SendCoinsAync(SendCoinsModel sendCoinsModel)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    await db.QueryAsync<WalletTableModel>("SendCoins",
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
