using Nethereum.Hex.HexTypes;
using Nethereum.RPC.Eth.DTOs;
using Nethereum.Web3;
using System;
using System.Linq;
using System.Numerics;
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
        private Web3 web3;

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
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();

                if (_amount.Value > 0 && _amount.Value <= wallet.Value
                    && wallet != null)
                {

                    var coinService = _coinManager
                               .CoinServices
                               .FirstOrDefault(x => x.CoinShortName == model.Currency);

                    if (coinService == null)
                    {
                        model.Status = "Error";
                        return model;
                    }

                    coinService.SendToAddress(model.Address, _amount.Value, "", "", true);


                    var tempStartBalance = wallet.Value;
                    wallet.Value -= _amount.Value;

                    await _eventsRepository.CreateEvent(new EventTableModel()
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
