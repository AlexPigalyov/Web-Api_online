using System;
using System.Threading.Tasks;
using Web_Api.online.Clients.Requests;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Extensions;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.WithdrawModels;
using Web_Api.online.Services;

namespace Web_Api.online.Clients
{
    public class EtheriumService
    {
        private WalletsRepository _walletsRepository;
        private IEventsRepository _eventsRepository;
        private IOutcomeTransactionRepository _outcomeTransactionRepository;
        private ETHRequestClient _ethRequestClient;
        private BalanceProvider _balanceProvider;
        private TransactionsRepository _transactionsRepository;

        public EtheriumService(WalletsRepository walletsRepository,
            IEventsRepository eventsRepository,
            IOutcomeTransactionRepository outcomeTransactionRepository,
            ETHRequestClient ethRequestClient,
            BalanceProvider balanceProvider,
            TransactionsRepository transactionsRepository)
        {
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _outcomeTransactionRepository = outcomeTransactionRepository;
            _ethRequestClient = ethRequestClient;
            _balanceProvider = balanceProvider;
            _transactionsRepository = transactionsRepository;
        }

        public async Task<string> GetNewAddressAsync(string lable)
        {
            return await _ethRequestClient.GetNewAddressAsync(lable);
        }

        public async Task<WalletTableModel> GetUpdatedWalletAsync(string userId)
        {
            var newIncomeTransactions = await _ethRequestClient.GetNewTransactions(userId);
            WalletTableModel wallet = await _walletsRepository.GetUserWalletAsync(userId, "ETH");

            foreach (var incomTransaction in newIncomeTransactions)
            {
                var result = await _balanceProvider.Income(wallet, incomTransaction);

                incomTransaction.PlatformCommission = result.Commission;
                wallet.Value = result.ResultBalanceReceiver.Value;

                incomTransaction.PlatformCommission = result.Commission;

                var _ = await _transactionsRepository.CreateIncomeTransactionAsync(incomTransaction);

                await _eventsRepository.CreateEventAsync(new EventTableModel()
                {
                    UserId = userId,
                    Type = (int)EventTypeEnum.Income,
                    Comment = $"Income transaction {incomTransaction.CurrencyAcronim}",
                    WhenDate = DateTime.Now,
                    CurrencyAcronim = incomTransaction.CurrencyAcronim,
                    StartBalance = result.StartBalanceReceiver,
                    ResultBalance = result.ResultBalanceReceiver,
                    PlatformCommission = result.Commission,
                    Value = incomTransaction.Amount
                });
            }

            await _walletsRepository.UpdateWalletBalanceAsync(wallet);

            return wallet;
        }

        public async Task<GeneralWithdrawModel> SendToAddress(GeneralWithdrawModel model, string userId)
        {
            // оставляем запас 0.001 на комисию блокчейна, можно вынести в константы
            decimal fixedCommicion = 0.0002m;
            try
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();

                if (wallet != null && _amount.Value > 0 && _amount.Value + fixedCommicion <= wallet.Value)
                {
                    var resultBalance = await _balanceProvider.Withdraw(_amount.Value, wallet);
                    //списываем с баланса значение транзакции 
                    wallet.Value = resultBalance.ResultBalanceSender;
                    await _walletsRepository.UpdateWalletBalanceAsync(wallet);


                    var tr = await _outcomeTransactionRepository.CreateOutcomeTransaction(
                                    new OutcomeTransactionTableModel()
                                    {
                                        FromWalletId = wallet.Id,
                                        ToAddress = model.Address,
                                        Value = _amount.Value,
                                        PlatformCommission = resultBalance.Commission,
                                        FixedCommission = fixedCommicion,
                                        CurrencyAcronim = "ETH",
                                        State = (int)OutcomeTransactionStateEnum.Created,
                                    });

                    var resultTr = await _ethRequestClient.ExecuteTransactionAsync(tr.Id);

                    if (resultTr.IsSuccess)
                    {
                        //списываем дополнительно комиссию 
                        wallet.Value -= resultTr.CommissionBlockchain.Value;

                        tr.State = resultTr.OutcomeTransactionState;
                        tr.BlockchainCommission = resultTr.CommissionBlockchain;

                        await _walletsRepository.UpdateWalletBalanceAsync(wallet);
                        await _eventsRepository.CreateEventAsync(new EventTableModel()
                        {
                            UserId = userId,
                            Type = (int)EventTypeEnum.Withdraw,
                            Comment = model.Comment,
                            Value = _amount.Value + resultTr.CommissionBlockchain.Value,
                            StartBalance = resultBalance.StartBalanceSender,
                            ResultBalance = resultBalance.ResultBalanceSender - resultTr.CommissionBlockchain.Value,
                            WhenDate = DateTime.Now,
                            CurrencyAcronim = model.Currency
                        });

                        model.Status = "Success";
                    }
                    else
                    {
                        tr.State = resultTr.OutcomeTransactionState;
                        tr.BlockchainCommission = resultTr.CommissionBlockchain;
                        tr.ErrorText = resultTr.ErrorText;

                        await _eventsRepository.CreateEventAsync(new EventTableModel()
                        {
                            UserId = userId,
                            Type = (int)EventTypeEnum.OutcomeTransactionError,
                            Comment = resultTr.ErrorText + " (commission not deducted)",
                            Value = _amount.Value,
                            StartBalance = resultBalance.StartBalanceSender,
                            ResultBalance = resultBalance.ResultBalanceSender,
                            WhenDate = DateTime.Now,
                            CurrencyAcronim = model.Currency
                        });

                        model.Status = "Error, your transaction will be processed manually";
                    }
                    await _outcomeTransactionRepository.UpdateTransactionAfterExecutionAsync(tr);
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
    }
}
