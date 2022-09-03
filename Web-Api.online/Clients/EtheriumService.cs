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
        private OutcomeTransactionRepository _outcomeTransactionRepository;
        private ETHRequestClient _ethRequestClient;
        private BalanceProvider _balanceProvider;


        public EtheriumService(WalletsRepository walletsRepository,
            IEventsRepository eventsRepository,
            OutcomeTransactionRepository outcomeTransactionRepository,
            ETHRequestClient ethRequestClient,
            BalanceProvider balanceProvider)
        {
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _outcomeTransactionRepository = outcomeTransactionRepository;
            _ethRequestClient = ethRequestClient;
            _balanceProvider = balanceProvider;
        }

        public string GetNewAddress(string lable)
        {
            return _ethRequestClient.GetNewAddress(lable);
        }

        public async Task<GeneralWithdrawModel> SendToAddress(GeneralWithdrawModel model, string userId)
        {
            // оставляем запас 0.001 на комисию блокчейна, можно вынесли в константы
            decimal fixedCommicion = 0.001m;
            try
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();

                if (wallet != null && _amount.Value > 0 && _amount.Value + fixedCommicion <= wallet.Value)
                {
                    var resultBalance = await _balanceProvider.Withdraw(_amount.Value, wallet);

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
                        wallet.Value = resultBalance.ResultBalanceSender - resultTr.CommissionBlockchain.Value;
                        await _walletsRepository.UpdateWalletBalanceAsync(wallet);

                        tr.State = resultTr.OutcomeTransactionState;
                        tr.BlockchainCommission = resultTr.CommissionBlockchain;

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
                    await _outcomeTransactionRepository.UpdateTransactionAfterExecutioAsync(tr);
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
