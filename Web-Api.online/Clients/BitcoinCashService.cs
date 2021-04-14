using Microsoft.Extensions.Configuration;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;

namespace Web_Api.online.Clients
{
    public class BitcoinCashService : CoinService, IBitcoinService
    {
        public BitcoinCashService(IConfiguration configuration, bool useTestnet = false) : base(configuration, useTestnet)
        {
        }

        public BitcoinCashService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword, short rpcRequestTimeoutInSeconds) : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword, rpcRequestTimeoutInSeconds)
        {
        }

        public BitcoinConstants.Constants Constants => BitcoinConstants.Constants.Instance;
    }
}
