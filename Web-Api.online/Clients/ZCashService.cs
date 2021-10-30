using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;

namespace Web_Api.online.Clients
{
    public class ZCashService : CoinService, IZCashService
    {
        public ZCashService(IConfiguration configuration, bool useTestnet = true) : base(configuration, useTestnet) { }

        public ZCashService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword,
            string walletPassword) : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword) { }

        public ZCashService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword,
            string walletPassword, short rpcRequestTimeoutInSeconds) : base(configuration, daemonUrl, rpcUsername,
            rpcPassword, walletPassword, rpcRequestTimeoutInSeconds)
        { }

        public ZCashConstants.Constants Constants { get; }

        public string SendToAddress(string zcashAddress, decimal amount, string comment = null, string commentTo = null, bool subtractFeeFromAmount = false, bool useInstantSend = false, bool usePrivateSend = false)
        {
            throw new NotImplementedException();
        }
    }
}
