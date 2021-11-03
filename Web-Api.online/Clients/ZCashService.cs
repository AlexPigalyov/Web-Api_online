using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;
using Web_Api.online.Clients.Models.ZecModels;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Extensions;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.WithdrawModels;

namespace Web_Api.online.Clients
{
    public class ZCashService 
    {
        private ZCashRequestClient client;
        private WalletsRepository _walletsRepository;
        private EventsRepository _eventsRepository;

        public ZCashService(IConfiguration config)
        {
            this.client = new(config);
        }

        #region get
        public string GetNewAddress()
        {
            var resp = client.MakeRequest<string>(ZecRestMethods.getnewaddress);

            return resp;
        }

        public object GetListAddresses()
        {
            var resp = client.MakeRequest<List<ZecAddressListResult>>(ZecRestMethods.listaddresses);

            return resp;
        }

        public List<string> GetTransparentListAddresses()
        {
            var resp = client.MakeRequest<List<ZecAddressListResult>>(ZecRestMethods.listaddresses);
            var list = resp.First().Transparent["addresses"];

            return list;
        }


        public ZecBalance GetAddressBalance(List<string> addresses)
        {
            Dictionary<string, List<string>> addressList = new()
            {
                { "addresses", addresses }
            };
            var resp = client.MakeRequest<ZecBalance>(ZecRestMethods.getaddressbalance, addressList);

            return resp;
        }


        public List<ZecDeltas> GetAddressDeltas(string address)
        {
            var resp = client.MakeRequest<List<ZecDeltas>>(ZecRestMethods.getaddressdeltas,
                new Dictionary<string, List<string>>() { { "addresses", new List<string>() { address } } });

            return resp;
        }


        public List<string> GetAddressIncomingTransactions(string address)
        {
            List<ZecDeltas> deltas = GetAddressDeltas(address);
            List<string> incomingTxs = deltas.Where(x => x.Satoshis > 0).Select(x => x.TxId).ToList();

            return incomingTxs;
        }

        #endregion


        // not correct works?
        public string SendFromToAddress(string fromAddress, string toAddress, float amount)
        {
            List<object> sendToAddressData = new List<object>()
            {
                fromAddress,
                new List<ZecSendToAddressData>(){ new ZecSendToAddressData(toAddress, amount) }
            };

            var resp = client.MakeRequest<string>(ZecRestMethods.z_sendmany, fromAddress, new List<ZecSendToAddressData>() { new ZecSendToAddressData(toAddress, amount) });
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
                    client.MakeRequest<string>(ZecRestMethods.sendtoaddress, model.Address,model.Amount);

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
