using Dapper;
using Microsoft.Build.Evaluation;
using Microsoft.Extensions.Configuration.UserSecrets;
using Nethereum.ABI.Util;
using Nethereum.Contracts.QueryHandlers.MultiCall;
using System;
using System.Data;
using System.Threading.Tasks;
using Web_Api.online.Clients.Models;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Web_Api.online.Services
{
    public class QiwiService
    {
        private QiwiRepository _qiwiRepository;
        private UserRepository _userRepository;
        private WalletsRepository _walletsRepository;
        private EventsRepository _eventsRepository;
        private ExceptionsRepository _exceptionsRepository;
        private WalletService _walletService;

        public QiwiService(
            QiwiRepository qiwiRepository,
            UserRepository userRepository,
            WalletsRepository walletsRepository,
            EventsRepository eventsRepository,
            ExceptionsRepository exceptionsRepository,
            WalletService walletService
            )
        {
            _qiwiRepository = qiwiRepository;
            _userRepository = userRepository;
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _exceptionsRepository = exceptionsRepository;
            _walletService = walletService;
        }

        public async Task<Phones> GetQiwiAcoount(string number)
        {
            return await _qiwiRepository.GetQiwiAcoount(number);
        }

        public async Task CheckQiwiAccountPaymentsHistory(string number)
        {
            Phones item = await _qiwiRepository.GetQiwiAcoount(number);

            var q = new QiwiCheckHistory(this);

            q.CheckPaymentsHistory(item.Number, item.Pwd);
        }

        public async Task AddQiwiPayment(CheckQiwiPayment checkQiwiPayment)
        {
            try
            {
                CashIns cashIn = new CashIns
                {
                    UserNumber = checkQiwiPayment.UserPublicId,
                    Value = checkQiwiPayment.Amount,
                    Sposob = "Qiwi",
                    WhenDate = checkQiwiPayment.Date,
                    AcceptedAccount = checkQiwiPayment.AcceptedAccount,
                    SendAccount = checkQiwiPayment.SendAccount
                };

                if (!_qiwiRepository.CheckExistCashIn(cashIn).Result)
                {
                    _qiwiRepository.AddCashIn(cashIn);

                    var user = await _userRepository.GetUserByPublicId(checkQiwiPayment.UserPublicId);

                    var wallet = await _walletsRepository.GetUserWalletAsync(user.Id, "RURT");

                    if (wallet is null)
                    {
                        WalletTableModel newWallet = new WalletTableModel();

                        newWallet.UserId = user.Id;
                        newWallet.CurrencyAcronim = "RURT";
                        newWallet.Address = _walletService.GetNewAddress("RURT", newWallet.UserId);

                        wallet = await _walletsRepository.CreateUserWalletAsync(newWallet);
                    }

                    decimal startBalanceWalletValue = wallet.Value;

                    wallet.Value = wallet.Value + (decimal)cashIn.Value;

                    await _walletsRepository.UpdateWalletBalanceAsync(wallet);

                    #region add event

                    {
                        await _eventsRepository.CreateEventAsync(new EventTableModel()
                        {
                            UserId = user.Id,
                            Type = (int)EventTypeEnum.Income,
                            Comment = $"Qiwi income RURT",
                            WhenDate = checkQiwiPayment.Date,
                            CurrencyAcronim = "RURT",
                            StartBalance = startBalanceWalletValue,
                            ResultBalance = wallet.Value,
                            PlatformCommission = 0,
                            Value = (decimal)cashIn.Value
                        });
                    }

                    #endregion
                }
            }
            catch (System.Exception ex)
            {
                await _exceptionsRepository.CreateExceptionAsync(ex);
            }
        }

        public async Task QiwiHistoryChecked(string number)
        {
            await _qiwiRepository.QiwiHistoryChecked(number);
        }

        public async Task<Phones> GetQiwiAcoountCashOut(double amount)
        {
            var result = await _qiwiRepository.GetQiwiAcoountCashOut(amount);

            return result;
        }
    }
}
