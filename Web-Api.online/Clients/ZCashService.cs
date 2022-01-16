using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Extensions;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.WithdrawModels;
using Web_Api.online.Requests;
using Web_Api.online.Services;

namespace Web_Api.online.Clients
{
    public class ZCashService
    {
        private ZCashRequestClient _client;
        private WalletsRepository _walletsRepository;
        private EventsRepository _eventsRepository;
        private TransactionsRepository _transactionsRepository;
        private BalanceProvider _balanceProvider;
        private OutcomeTransactionRepository _outcomeTransactionRepository;

        public ZCashService(IConfiguration config, WalletsRepository walletsRepository,
            EventsRepository eventsRepository, TransactionsRepository transactionsRepository,
            BalanceProvider balanceProvider, OutcomeTransactionRepository outcomeTransactionRepository)
        {
            _client = new(config);
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _transactionsRepository = transactionsRepository;
            _balanceProvider = balanceProvider;
            _outcomeTransactionRepository = outcomeTransactionRepository;
        }

        public string GetNewAddress()
        {
            return _client.MakeRequest<string>(ZecRestMethods.getnewaddress);
        }

        public async Task<GeneralWithdrawModel> SendToAddress(GeneralWithdrawModel model, string userId)
        {
            try
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();

                if (wallet != null && _amount.Value > 0 && _amount.Value <= wallet.Value)
                {
                    var result = await _balanceProvider.Withdraw(_amount.Value, wallet);
                    wallet.Value = result.ResultBalanceSender;


                    var tr = await _outcomeTransactionRepository.CreateOutcomeTransaction(
                                    new OutcomeTransactionTableModel()
                                    {
                                        FromWalletId = wallet.Id,
                                        ToAddress = model.Address,
                                        Value = _amount.Value,
                                        PlatformCommission = result.Commission,
                                        CurrencyAcronim = "ZEC",
                                        State = (int)OutcomeTransactionStateEnum.Finished
                                    });

                    // check if need to convert Amount
                    var txId = _client.MakeRequest<string>(ZecRestMethods.sendtoaddress, model.Address, model.Amount);


                    await _eventsRepository.CreateEventAsync(new EventTableModel()
                    {
                        UserId = userId,
                        Type = (int)EventTypeEnum.Withdraw,
                        Comment = model.Comment,
                        Value = _amount.Value,
                        StartBalance = result.StartBalanceSender,
                        ResultBalance = result.ResultBalanceSender,
                        WhenDate = DateTime.Now,
                        CurrencyAcronim = model.Currency
                    });

                    model.Status = "Success";
                    await _walletsRepository.UpdateWalletBalanceAsync(wallet);
                }
                else
                {
                    model.Status = "Not enough coins";
                }
            }
            catch (Exception e)
            {
                model.Status = "Error";
                return model;
            }

            return model;
        }

        public async Task<WalletTableModel> GetUpdatedWalletAsync(string userId)
        {
            WalletTableModel wallet = await _walletsRepository.GetUserWalletAsync(userId, "ZEC");

            if (wallet == null)
            {
                return null;
            }

            List<IncomeWalletTableModel> incomeZecWallets = await _walletsRepository.GetUserIncomeWalletsByAcronimAsync(userId, "ZEC");

            List<IncomeTransactionTableModel> transactionModels = await _transactionsRepository.GetIncomeTransactions(userId, "ZEC");
            List<string> savedTransactions = transactionModels.Select(x => x.TransactionId).ToList();

            foreach (var incomeZecWallet in incomeZecWallets)
            {
                List<ZecDeltas> addressIncomeTransactions = GetAddressIncomingTransactions(incomeZecWallet.Address);

                foreach (var tx in addressIncomeTransactions)
                {
                    if (!savedTransactions.Contains(tx.TxId))
                    {
                        var transaction = await _transactionsRepository.CreateIncomeTransactionAsync(new IncomeTransactionTableModel()
                        {
                            CurrencyAcronim = "ZEC",
                            TransactionId = tx.TxId,
                            Amount = tx.Satoshis / 100000000,
                            UserId = userId,
                            FromAddress = null,
                            ToAddress = tx.Address,
                            TransactionFee = 0,

                        });

                       
                        var result = await _balanceProvider.Income(wallet, transaction);

                        await _eventsRepository.CreateEventAsync(new EventTableModel()
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
                        });

                        transaction.PlatformCommission = result.Commission;
                        wallet.Value = result.ResultBalanceSender;

                        transaction.PlatformCommission = result.Commission;

                        await _transactionsRepository.CreateIncomeTransactionAsync(transaction);
                    }
                }
            }

            await _walletsRepository.UpdateWalletBalanceAsync(wallet);

            return wallet;
        }

        private List<ZecDeltas> GetAddressDeltas(string address)
        {
            var resp = _client.MakeRequest<List<ZecDeltas>>(ZecRestMethods.getaddressdeltas,
                new Dictionary<string, List<string>>() { { "addresses", new List<string>() { address } } });

            return resp;
        }

        private List<ZecDeltas> GetAddressIncomingTransactions(string address)
        {
            return GetAddressDeltas(address).Where(x => x.Satoshis > 0).ToList();
        }
    }
}
