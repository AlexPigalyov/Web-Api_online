﻿using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;
using System;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public class TransactionsRepository
    {
        private readonly IConfiguration _configuration;

        public TransactionsRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<IncomeTransactionTableModel>> GetLastIncomeTransactionsByUserIdAsync(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    List<IncomeTransactionTableModel> result = (List<IncomeTransactionTableModel>)(await db.QueryAsync<IncomeTransactionTableModel>
                        ("spGetLastIncomeTransactionsByUserId",
                          new { userId = userId },
                          commandType: CommandType.StoredProcedure));

                    return result;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task<IncomeTransactionTableModel> CreateIncomeTransactionAsync(IncomeTransactionTableModel incomeTransaction)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("ExchangeConnection")))
            {
                try
                {
                    var p = new DynamicParameters();
                    p.Add("currencyAcronim", incomeTransaction.CurrencyAcronim);
                    p.Add("transactionId", incomeTransaction.TransactionId);
                    p.Add("amount", incomeTransaction.Amount);
                    p.Add("transactionFee", incomeTransaction.TransactionFee);
                    p.Add("toAddress", incomeTransaction.ToAddress);
                    p.Add("date", incomeTransaction.Date);
                    p.Add("userId", incomeTransaction.UserId);
                    p.Add("incomeWalletId", incomeTransaction.WalletId);
                    p.Add("new_identity", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    await db.QueryAsync<int>("spCreateIncomeTransaction", p, commandType: CommandType.StoredProcedure);

                    incomeTransaction.Id = p.Get<int>("new_identity");

                    return incomeTransaction;
                }
                catch (Exception ex) { return null; }
            }
        }

        public async Task CreateIncomeTransactionsAsync(List<IncomeTransactionTableModel> incomeTransactions)
        {
            foreach(var tr in incomeTransactions)
            {
                await CreateIncomeTransactionAsync(tr);
            }
        }
    }
}
