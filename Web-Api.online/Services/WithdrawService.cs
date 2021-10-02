using System;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
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
        private EventsRepository _eventsRepository;

        public WithdrawService(WalletsRepository walletsRepository,
           EventsRepository eventsRepository,
           ICoinManager coinManager)
        {
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _coinManager = coinManager;
        }

        public virtual async Task<GeneralWithdrawModel> Send(GeneralWithdrawModel model, string userId)
        {
            try
            {
                var coinService = _coinManager
                                .CoinServices
                                .FirstOrDefault(x => x.CoinShortName == model.Currency);

                if(coinService == null)
                {
                    model.Status = "Error";
                    return model;
                }

                var wallet = await _walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();
                if (_amount.Value > 0 && _amount.Value <= wallet.Value)
                {
                    coinService.SendToAddress(model.Address, _amount.Value, "", "", true);
                    wallet.Value -= _amount.Value;

                    await _eventsRepository.CreateEvent(new EventTableModel()
                    {
                        UserId = userId,
                        Type = (int)EventTypeEnum.Withdraw,
                        Comment = model.Comment,
                        Value = _amount.Value,
                        WhenDate = DateTime.Now,
                        CurrencyAcronim = model.Currency
                    });
                    model.Status = "Success";
                    await _walletsRepository.UpdateWalletBalance(wallet);
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
