using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories;
using Web_Api.online.Repositories.Abstract;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Services
{
    public class TransactionManager
    {
        private TransactionsRepository _transactionsRepository;
        private WalletsRepository _walletsRepository;
        private ICoinManager _coinManager;
        private IEventsRepository _eventsRepository;


        private string userId;
        private List<IncomeWallet> incomeWallets;
        private List<Wallet> wallets;

        public TransactionManager(TransactionsRepository transactionsRepository,
            ICoinManager coinManager, WalletsRepository walletsRepository,
            IEventsRepository eventsRepository)
        {
            _transactionsRepository = transactionsRepository;
            _coinManager = coinManager;
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
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
                                                        x.CoinShortName == y.CurrencyAcronim))
                                .ToList(); // убирает лишние сервисы, останутся только те у которых юзер имеет кошелёк

            foreach (var coin in coinServices)
            {
                var listIncomeTransactionsToSave = new List<IncomeTransaction>();

                var lastTr = incomeLastTransactions
                                 .FirstOrDefault(tr =>
                                    tr.CurrencyAcronim == coin.CoinShortName);

                for (int i = 0; ; i++)
                {
                    SearchLastNoSaveTransaction(listIncomeTransactionsToSave, i, coin);
                    if (listIncomeTransactionsToSave.Count() == 0)
                    {
                        break;
                    }
                    else if (lastTr == null && listIncomeTransactionsToSave.Count() != 0)
                    {
                        int countTr = listIncomeTransactionsToSave.Count();
                        SearchLastNoSaveTransaction(listIncomeTransactionsToSave, ++i, coin);

                        if(countTr == listIncomeTransactionsToSave.Count())
                        {
                            await _transactionsRepository.CreateIncomeTransactionsAsync(listIncomeTransactionsToSave
                                .OrderBy(x=>x.Date)
                                .ToList());
                            await UpdateBalance(listIncomeTransactionsToSave);
                            break;
                        }
                    }
                    else if (listIncomeTransactionsToSave.Last().TransactionId == lastTr.TransactionId)
                    {
                        listIncomeTransactionsToSave.Remove(listIncomeTransactionsToSave.Last());
                        if (listIncomeTransactionsToSave.Count() != 0)
                        {
                            await _transactionsRepository.CreateIncomeTransactionsAsync(listIncomeTransactionsToSave
                                .OrderBy(x => x.Date)
                                .ToList());
                            await UpdateBalance(listIncomeTransactionsToSave);
                        }
                        break;
                    }
                }
            }
        }

        private void SearchLastNoSaveTransaction(List<IncomeTransaction> incomeTransactionsResult,
            int from,
            ICoinService coinService)
        {
            var newTransactionInBlockchain = coinService.ListTransactions(userId, 1, from).FirstOrDefault();

            if (newTransactionInBlockchain != null)
            {
                var wallet = incomeWallets.FirstOrDefault(w => w.Address == newTransactionInBlockchain.Address);
                incomeTransactionsResult.Add(
                    ConvertTransactionResponseToIncomeTransaction(
                        newTransactionInBlockchain,
                        coinService.CoinShortName,
                        wallet.Id));
            }
        }

        private IncomeTransaction ConvertTransactionResponseToIncomeTransaction(TransactionResponse transaction,
            string shortNameCurrency, int walletId)
        {
            return new IncomeTransaction()
            {
                CurrencyAcronim = shortNameCurrency,
                TransactionId = transaction.TxId,
                Amount = transaction.Amount,
                TransactionFee = transaction.Fee, // не видит комиссию
                ToAddress = transaction.Address,
                Date = transaction.Time,
                UserId = userId,
                WalletId = walletId
            };
        }

        private async Task UpdateBalance(List<IncomeTransaction> incomeTransactions)
        {
            foreach (var tr in incomeTransactions)
            {
                var w = wallets.FirstOrDefault(t => t.CurrencyAcronim == tr.CurrencyAcronim);
                w.Value = w.Value + tr.Amount;
                await _walletsRepository.UpdateWalletBalance(w);

                var _value = tr.Amount - tr.TransactionFee;
                await _eventsRepository.CreateAsync(new Events()
                {
                    UserId = userId,
                    Type = EventType.IncomeLTC,
                    Comment = $"Income transaction {tr.CurrencyAcronim}",
                    Value = _value,
                    WhenDate = DateTime.Now
                });
            }
        }
    }
}
