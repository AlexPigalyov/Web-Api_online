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

        public async Task<Wallet> GetUserWalletAsync(string userId, string acronim)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    Wallet result = await db.QueryFirstOrDefaultAsync<Wallet>("spGetUserWalletByAcronim",
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
                    List<IncomeWallet> result = (List<IncomeWallet>)(await db.QueryAsync<IncomeWallet>("spGetUserIncomeWallets",
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

                    await db.QueryAsync<int>("spCreateUserIncomeWallet", p, commandType: CommandType.StoredProcedure);

                    wallet.Id = p.Get<int>("new_identity");

                    return wallet;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<Wallet> CreateUserWalletAsync(Wallet wallet)
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

                    await db.QueryAsync<int>("spCreateUserWallet", p, commandType: CommandType.StoredProcedure);

                    wallet.Id = p.Get<int>("new_identity");

                    return wallet;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task UpdateWalletBalance(Wallet wallet)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    await db.QueryAsync<Wallet>("spUpdateWalletBalance",
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

        public async Task SendCoinsAync(SendCoinsModel sendCoinsModel)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    await db.QueryAsync<Wallet>("spSendCoins",
                        new
                        {
                            senderUserId = sendCoinsModel.EventSender.UserId,
                            receiverUserId = sendCoinsModel.EventReceiver.UserId,
                            typeSend = sendCoinsModel.EventSender.Type,
                            typeRecieve = sendCoinsModel.EventReceiver.Type,
                            senderCommentEvent = sendCoinsModel.EventSender.Comment,
                            receiverCommentEvent = sendCoinsModel.EventReceiver.Comment,
                            currencyAcronim = sendCoinsModel.EventSender.CurrencyAcronim,
                            value = sendCoinsModel.EventSender.Value,
                            senderWalletId = sendCoinsModel.WalletSender.Id,
                            senderNewWalletBalance = sendCoinsModel.WalletSender.Value,
                            receiverWalletId = sendCoinsModel.WalletReceiver.Id,
                            receiverNewWalletBalance = sendCoinsModel.WalletReceiver.Value
                        },
                              commandType: CommandType.StoredProcedure);

                }
                catch (Exception ex) { return; }
            }
        }

        public async Task<List<Currency>> GetCurrenciesAsync()
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
