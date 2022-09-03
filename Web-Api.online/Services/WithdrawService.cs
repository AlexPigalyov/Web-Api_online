using System;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Extensions;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.WithdrawModels;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Services
{
    public class WithdrawService
    {
        private WalletsRepository _walletsRepository;
        private ICoinManager _coinManager;
        private IEventsRepository _eventsRepository;
        private BalanceProvider _balanceProvider;
        private OutcomeTransactionRepository _outcomeTransactionRepository;


        public WithdrawService(WalletsRepository walletsRepository,
           IEventsRepository eventsRepository,
           ICoinManager coinManager,
           BalanceProvider balanceProvider,
           OutcomeTransactionRepository outcomeTransactionRepository)
        {
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _coinManager = coinManager;
            _balanceProvider = balanceProvider;
            _outcomeTransactionRepository = outcomeTransactionRepository;
        }

        public virtual async Task<GeneralWithdrawModel> Send(GeneralWithdrawModel model, string userId)
        {
            try
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();

                if (wallet != null && _amount.Value > 0 && _amount.Value <= wallet.Value)
                {

                    var coinService = _coinManager
                               .CoinServices
                               .FirstOrDefault(x => x.CoinShortName == model.Currency);

                    if (coinService == null)
                    {
                        model.Status = "Error";
                        return model;
                    }

                    var result = await _balanceProvider.Withdraw(_amount.Value, wallet);
                    wallet.Value = result.ResultBalanceSender;

                    if (result.Commission.HasValue)
                    {
                        coinService.SendToAddress(model.Address, _amount.Value - result.Commission.Value, "", "", true);
                    }
                    else
                    {
                        coinService.SendToAddress(model.Address, _amount.Value, "", "", true);
                    }

                    var tr = await _outcomeTransactionRepository.CreateOutcomeTransaction(
                                   new OutcomeTransactionTableModel()
                                   {
                                       FromWalletId = wallet.Id,
                                       ToAddress = model.Address,
                                       Value = _amount.Value,
                                       CurrencyAcronim = model.Currency,
                                       State = (int)OutcomeTransactionStateEnum.Finished
                                   });

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
            catch
            {
                model.Status = "Error";
                return model;
            }

            return model;
        }
    }
}
