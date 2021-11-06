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

namespace Web_Api.online.Clients
{
    public class ZCashService 
    {
        private ZCashRequestClient _client;
        private WalletsRepository _walletsRepository;
        private EventsRepository _eventsRepository;
        private TransactionsRepository _transactionsRepository;


        public ZCashService(IConfiguration config, WalletsRepository walletsRepository,
            EventsRepository eventsRepository, TransactionsRepository transactionsRepository)
        {
            _client = new(config);
            _walletsRepository = walletsRepository;
            _eventsRepository = eventsRepository;
            _transactionsRepository = transactionsRepository;
        }


        public string GetNewAddress()
        {
            var resp = _client.MakeRequest<string>(ZecRestMethods.getnewaddress);

            return resp;
        }

        public async Task<GeneralWithdrawModel> SendToAddress(GeneralWithdrawModel model, string userId)
        {

            try
            {
                var wallet = await _walletsRepository.GetUserWalletAsync(userId, model.Currency);
                decimal? _amount = model.Amount.ConvertToDecimal();

                if (_amount.Value > 0 && _amount.Value <= wallet.Value
                    && wallet != null)
                {
                    // check if need to convert Amount
                    _client.MakeRequest<string>(ZecRestMethods.sendtoaddress, model.Address, model.Amount);

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
                    await _walletsRepository.UpdateWalletBalanceAsync(wallet);
                    //await _walletsRepository.UpdateWalletBalance(wallet);
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


        public async Task<WalletTableModel> GetUpdatedWalletAsync(string userId)
        {
            WalletTableModel wallet = await _walletsRepository.GetUserWalletAsync(userId, "ZEC");


            List<IncomeWalletTableModel> incomeZecWallets = (await _walletsRepository.GetUserIncomeWalletsAsync(userId))
                .Where(x=>x.CurrencyAcronim == "ZEC").ToList();


            List<IncomeTransactionTableModel> transactionModels = await _transactionsRepository.GetIncomeTransactions(userId, "ZEC");
            List<string> savedTransactions = transactionModels.Select(x => x.TransactionId).ToList();

            foreach (var incomeZecWallet in incomeZecWallets)
            {
                List<ZecDeltas> addressIncomeTransactions = GetAddressIncomingTransactions(incomeZecWallet.Address);
                
                foreach(var tx in addressIncomeTransactions)
                {
                    if (!savedTransactions.Contains(tx.TxId))
                    {
                        wallet.Value += tx.Satoshis;

                        await _transactionsRepository.CreateIncomeTransactionAsync(new IncomeTransactionTableModel()
                        {
                            CurrencyAcronim = "ZEC",
                            TransactionId = tx.TxId,
                            Amount = tx.Satoshis,
                            UserId = userId,
                            FromAddress = "",
                            ToAddress = "",
                            TransactionFee = 0,

                        });
                    }
                }

            }

            await _walletsRepository.UpdateWalletBalanceAsync(wallet);

            return wallet;
        }


        #region get

        private object GetListAddresses()
        {
            var resp = _client.MakeRequest<List<ZecAddressListResult>>(ZecRestMethods.listaddresses);

            return resp;
        }

        private List<string> GetTransparentListAddresses()
        {
            var resp = _client.MakeRequest<List<ZecAddressListResult>>(ZecRestMethods.listaddresses);
            var list = resp.First().Transparent["addresses"];

            return list;
        }

        private ZecBalance GetAddressBalance(List<string> addresses)
        {
            Dictionary<string, List<string>> addressList = new()
            {
                { "addresses", addresses }
            };
            var resp = _client.MakeRequest<ZecBalance>(ZecRestMethods.getaddressbalance, addressList);

            return resp;
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

        #endregion

    }
}
