using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;
using Web_Api.online.Clients.Models.ZecModels;

namespace Web_Api.online.Clients
{
    public class ZCashService
    {
        private ZCashRequestClient client;

        public ZCashService()
        {
            this.client = new();
        }


        public string GetNewAddress()
        {
            var resp = client.MakeRequest<string>(RestMethods.getnewaddress);

            return resp;
        }

        public object GetListAddresses()
        {
            var resp = client.MakeRequest<List<ZecAddressListResult>>(RestMethods.listaddresses);

            return resp;
        }

        public List<string> GetTransparentListAddresses()
        {
            var resp = client.MakeRequest<List<ZecAddressListResult>>(RestMethods.listaddresses);
            var list = resp.First().Transparent["addresses"];

            return list;
        }


        public ZecBalance GetAddressBalance(List<string> addresses)
        {
            Dictionary<string, List<string>> addressList = new()
            {
                { "addresses", addresses }
            };
            var resp = client.MakeRequest<ZecBalance>(RestMethods.getaddressbalance, addressList);

            return resp;
        }


        public string SendFromToAddress(string fromAddress, string toAddress, float amount)
        {
            List<object> sendToAddressData = new List<object>()
            {
                fromAddress,
                new List<ZecSendToAddressData>(){ new ZecSendToAddressData(toAddress, amount) }
            };

            var resp = client.MakeRequest<string>(RestMethods.z_sendmany, fromAddress, new List<ZecSendToAddressData>() { new ZecSendToAddressData(toAddress, amount) });
            return resp;
        }


    }
}
