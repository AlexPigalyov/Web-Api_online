using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Services
{
    public class TransactionManager
    {
        private TransactionsRepository _transactionsRepository;
        private WalletsRepository _walletsRepository;
        private ICoinManager _coinManager;
        private IEventsRepository _eventsRepository;
        private ZCashService _zecService;
        private BalanceProvider _balanceProvider; 
        private EtheriumService _etheriumService;

        public TransactionManager(TransactionsRepository transactionsRepository,
            ICoinManager coinManager, WalletsRepository walletsRepository,
            IEventsRepository eventsRepository,
            ZCashService zecService,
            BalanceProvider balanceProvider,
            EtheriumService etheriumService)
        {
            _transactionsRepository = transactionsRepository;
            _coinManager = coinManager;
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _zecService = zecService;
            _balanceProvider = balanceProvider;
            _etheriumService = etheriumService;
        }

        public async Task<List<WalletTableModel>> GetUpdatedWalletsAsync(string userId)
        {
            var incomeWallets = await _walletsRepository.GetUserIncomeWalletsAsync(userId);
            
            // работает?
            //if(incomeWallets.Any(y => y.CurrencyAcronim == "ZEC"))
            //{
            //    var zecWallet = await _zecService.GetUpdatedWalletAsync(userId);
            //    wallets.Add(zecWallet);
            //}

            if (incomeWallets.Any(y => y.CurrencyAcronim == "ETH"))
            {
                var ethWallet = await _etheriumService.GetUpdatedWalletAsync(userId);
            }

            var wallets = await _walletsRepository.GetUserWalletsAsync(userId);

            List<IncomeTransactionTableModel> incomeLastTransactions = await _transactionsRepository.GetLastIncomeTransactionsByUserIdAsync(userId) ??
                        new List<IncomeTransactionTableModel>();

            var coinServices = _coinManager
                                .CoinServices
                                .Where(x => incomeWallets.Any(y => x.CoinShortName == y.CurrencyAcronim))
                                .ToList(); // убирает лишние сервисы, останутся только те у которых юзер имеет кошелёк


            foreach (var coin in coinServices)
            {
                try
                {
                    var currencyTableModel = await _walletsRepository.GetCurrencyByAcronimAsync(coin.CoinShortName);

                    var transactionsInBlockchain = coin.ListTransactions(userId);  //не видит комиссию, в респонсе нету инфы о комиссии

                    var lastTr = incomeLastTransactions
                                     .FirstOrDefault(tr =>
                                        tr.CurrencyAcronim == coin.CoinShortName);

                    List<TransactionResponse> newTransactionsInBlockchain;
                    if (lastTr == null)
                    {
                        newTransactionsInBlockchain = transactionsInBlockchain;
                    }
                    else
                    {
                        newTransactionsInBlockchain = transactionsInBlockchain.Where(x => x.Time > lastTr.Date).ToList();//дата в секундах лежит,  я не переводил
                                                                                                                         //можно как в блокчейне написать BlockTime
                                                                                                                         //поменять
                    }

                    var wallet = wallets.FirstOrDefault(t => t.CurrencyAcronim == coin.CoinShortName);

                    foreach (var blockchainTransaction in newTransactionsInBlockchain)
                    {
                        var transactionInfo = coin.GetTransaction(blockchainTransaction.TxId);

                        var transaction = new IncomeTransactionTableModel()
                        {
                            CurrencyAcronim = coin.CoinShortName,
                            TransactionHash = blockchainTransaction.TxId,
                            Amount = blockchainTransaction.Amount,
                            TransactionFee = transactionInfo.Fee,
                            ToAddress = blockchainTransaction.Address,
                            Date = blockchainTransaction.Time,
                            UserId = userId,
                            WalletId = wallet.Id
                        };

                        var result = await _balanceProvider.Income(wallet, transaction);

                        var ev = new EventTableModel()
                        {
                            UserId = userId,
                            Type = (int)EventTypeEnum.Income,
                            Comment = $"Income transaction {transaction.CurrencyAcronim}",
                            WhenDate = DateTime.Now,
                            CurrencyAcronim = transaction.CurrencyAcronim,
                            StartBalance = result.StartBalanceReceiver,
                            ResultBalance = result.ResultBalanceReceiver,
                            PlatformCommission = result.Commission,
                            Value = transaction.Amount
                        };

                        transaction.PlatformCommission = result.Commission;
                        wallet.Value = result.ResultBalanceReceiver.Value;

                        transaction.PlatformCommission = result.Commission;

                        await _transactionsRepository.CreateIncomeTransactionAsync(transaction);
                        await _walletsRepository.UpdateWalletBalanceAsync(wallet);
                        await _eventsRepository.CreateEventAsync(ev);
                    }
                }
                catch { }
            }
            return wallets;
        }
    }
}
