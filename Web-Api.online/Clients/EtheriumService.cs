using System;
using System.Threading.Tasks;
using Web_Api.online.Clients.Requests;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Extensions;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.WithdrawModels;

namespace Web_Api.online.Clients
{
    public class EtheriumService
    {
        private WalletsRepository walletsRepository;
        private EventsRepository eventsRepository;
        private OutcomeTransactionRepository outcomeTransactionRepository;
        private ETHRequestClient ethRequestClient;

        public EtheriumService(WalletsRepository walletsRepository,
            EventsRepository eventsRepository,
            OutcomeTransactionRepository outcomeTransactionRepository,
            ETHRequestClient ethRequestClient)
        {
            this.walletsRepository = walletsRepository;
            this.eventsRepository = eventsRepository;
            this.outcomeTransactionRepository = outcomeTransactionRepository;
            this.ethRequestClient = ethRequestClient;
        }


        public string GetNewAddress(string lable)
        {
            return ethRequestClient.GetNewAddress(lable);
        }

        public async Task<GeneralWithdrawModel> SendToAddress(GeneralWithdrawModel model, string userId)
        {
            try
            {
                var wallet = await walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();

                if (_amount.Value > 0 && _amount.Value <= wallet.Value
                    && wallet != null)
                {
                    var tr = await outcomeTransactionRepository.CreateOutcomeTransaction(
                                    new OutcomeTransactionTableModel()
                                    {
                                        FromWalletId = wallet.Id,
                                        ToAddress = model.Address,
                                        Value = _amount.Value,
                                        CurrencyAcronim = "ETH",
                                        State = (int)OutcomeTransactionStateEnum.Created
                                    });

                    ethRequestClient.ExecuteTransaction(tr.Id);

                    var tempStartBalance= wallet.Value;
                    wallet.Value -= _amount.Value;

                    await eventsRepository.CreateEvent(new EventTableModel()
                    {
                        UserId = userId,
                        Type = (int)EventTypeEnum.Withdraw,
                        Comment = model.Comment,
                        Value = _amount.Value,
                        StartBalance = tempStartBalance,
                        ResultBalance = wallet.Value,
                        WhenDate = DateTime.Now,
                        CurrencyAcronim = model.Currency
                    });
                    model.Status = "Success";
                    await walletsRepository.UpdateWalletBalanceAsync(wallet);
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
