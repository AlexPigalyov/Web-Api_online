using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;
using Web_Api.online.Models;
using Web_Api.online.Repositories;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Services
{
    public class TransactionManager
    {
        private TransactionsRepository _transactionsRepository;
        private WalletsRepository _walletsRepository;
        private ICoinManager _coinManager;


        private string userId;
        private int amountTransactionsToGet = 10;
        private List<IncomeWallet> incomeWallets;
        private List<Wallet> wallets;

        public TransactionManager(TransactionsRepository transactionsRepository,
            ICoinManager coinManager, WalletsRepository walletsRepository)
        {
            _transactionsRepository = transactionsRepository;
            _coinManager = coinManager;
            _walletsRepository = walletsRepository;
        }

        public async Task<List<Wallet>> GetUpdatedWallets(string userId)
        {
            this.userId = userId;
            incomeWallets = await _walletsRepository.GetUserIncomeWalletsAsync(userId);
            wallets = await _walletsRepository.GetUserWalletsAsync(userId);
            await SearchNewIncomeTransactionsAsync();
            return wallets;
        }

        private async Task SearchNewIncomeTransactionsAsync()
        {
            var incomeLastTransactions = await _transactionsRepository.GetLastIncomeTransactionsByUserIdAsync(userId);

            var coinServices = _coinManager
                                .CoinServices
                                .Where(x => incomeWallets
                                                .Any(y =>
                                                        x.CoinShortName.ToLower() == y.CurrencyAcronim.ToLower()))
                                .ToList(); // убирает лишние сервисы, останутся только те у которых юзер имеет кошелёк

            foreach (var coin in coinServices)
            {
                var listIncomeTransactionsToSave = new List<IncomeTransaction>();

                var lastTr = incomeLastTransactions
                                 .FirstOrDefault(tr =>
                                    tr.CurrencyAcronim.Trim().ToLower() == coin.CoinShortName.ToLower());

                if (lastTr == null)
                {

                    SearshLastNoSaveTransactions(listIncomeTransactionsToSave, coin);
                    if (listIncomeTransactionsToSave.Count() != 0)
                    {
                        await _transactionsRepository.CreateIncomeTransactionsAsync(listIncomeTransactionsToSave);
                        await UpdateBalance(listIncomeTransactionsToSave);
                    }
                }
                else
                {
                    SearshLastNoSaveTransactions(listIncomeTransactionsToSave, lastTr, coin);
                    if (listIncomeTransactionsToSave.Count() != 0)
                    {
                        listIncomeTransactionsToSave = listIncomeTransactionsToSave.Where(c => c.Date > lastTr.Date).ToList();
                        await _transactionsRepository.CreateIncomeTransactionsAsync(listIncomeTransactionsToSave);
                        await UpdateBalance(listIncomeTransactionsToSave);
                    }
                }
            }
        }

        private void SearshLastNoSaveTransactions(List<IncomeTransaction> incomeTransactionsResult,
            IncomeTransaction lastTransaction,
            ICoinService coinService,
            int calls = 0)
        {
            var lastTransactionsBlockchain = coinService.ListTransactions(userId, amountTransactionsToGet, calls * amountTransactionsToGet);
            var lastSavedTransaction = lastTransactionsBlockchain.FirstOrDefault(tr => tr.TxId == lastTransaction.TransactionId);

            if (lastSavedTransaction == null)
            {
                SearshLastNoSaveTransactions(incomeTransactionsResult, lastTransaction, coinService, ++calls);
            }

            incomeTransactionsResult.AddRange(
                ConvertListTransactionsResponseToIncomeTransactions(lastTransactionsBlockchain,
                coinService.CoinShortName));
        }

        private void SearshLastNoSaveTransactions(List<IncomeTransaction> incomeTransactionsResult,
            ICoinService coinService)
        {
            var allTransactionsBlockchain = coinService.ListTransactions(userId);

            if (allTransactionsBlockchain.Count() != 0)
            {
                incomeTransactionsResult.AddRange(
                    ConvertListTransactionsResponseToIncomeTransactions(allTransactionsBlockchain,
                                                                            coinService.CoinShortName));
            }
        }

        private List<IncomeTransaction> ConvertListTransactionsResponseToIncomeTransactions(List<ListTransactionsResponse> listTransactions,
            string shortNameCurrency)
        {
            List<IncomeTransaction> incomeTransactions = new List<IncomeTransaction>();
            foreach (var tr in listTransactions)
            {
                var wallet = incomeWallets.FirstOrDefault(w => w.Address == tr.Address);
                incomeTransactions.Add(ConvertListTransactionsResponseToIncomeTransactions(tr, shortNameCurrency, wallet.Id));
            }
            return incomeTransactions;
        }

        private IncomeTransaction ConvertListTransactionsResponseToIncomeTransactions(ListTransactionsResponse transaction,
            string shortNameCurrency, int walletId)
        {
            return new IncomeTransaction()
            {
                CurrencyAcronim = shortNameCurrency,
                TransactionId = transaction.TxId,
                Amount = transaction.Amount,
                TransactionFee = transaction.Fee, // не видит комиссию
                ToAddress = transaction.Address,
                Date = (decimal)transaction.Time,
                UserId = userId,
                WalletId = walletId
            };
        }

        private async Task UpdateBalance(List<IncomeTransaction> incomeTransactions)
        {
            foreach(var tr in incomeTransactions)
            {
                var w = wallets.FirstOrDefault(t => t.CurrencyAcronim.ToLower() == tr.CurrencyAcronim.ToLower());
                w.Value = w.Value + tr.Amount;
            }

            foreach(var w in wallets)
            {
                await _walletsRepository.UpdateWalletBalance(w);
            }
        }
    }
}
