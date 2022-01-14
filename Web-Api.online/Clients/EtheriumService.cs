using System;
using System.Threading.Tasks;
using Web_Api.online.Clients.Requests;
using Web_Api.online.Data.Repositories;
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
        private EventsRepository _eventsRepository;
        private OutcomeTransactionRepository _outcomeTransactionRepository;
        private ETHRequestClient _ethRequestClient;
        private BalanceProvider _balanceProvider;


        public EtheriumService(WalletsRepository walletsRepository,
            EventsRepository eventsRepository,
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
                                        PlatformCommission =result.Commission,
                                        CurrencyAcronim = "ETH",
                                        State = (int)OutcomeTransactionStateEnum.Created
                                    });

                    //TODO здесь отправляем запрос на внешний сервис который работает с блокчейном, там будет создана транзакция
                    //закомчено, тк проблемы с эфиром
                    //создаётся транзакция которую ручками выводим
                    //_ethRequestClient.ExecuteTransaction(tr.Id);

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
    }
}
