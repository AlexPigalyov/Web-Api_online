using Microsoft.Extensions.Configuration;
using Web_Api.online.Clients.Models;
using Web_Api.online.Clients.Interfaces;

namespace Web_Api.online.Clients
{
    public class BitcoinService : CoinService, IBitcoinService
    {
        public BitcoinService(IConfiguration configuration, bool useTestnet = false) : base(configuration, useTestnet)
        {
        }

        public BitcoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword)
            : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword)
        {
        }

        public BitcoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword, short rpcRequestTimeoutInSeconds)
            : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword, rpcRequestTimeoutInSeconds)
        {
        }

        public BitcoinConstants.Constants Constants => BitcoinConstants.Constants.Instance;

        public string SendToAddress(string bitcoinAddress, decimal amount, string comment, string commentTo, bool subtractFeeFromAmount, bool allowReplaceByFee)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.sendtoaddress, bitcoinAddress, amount, comment, commentTo, subtractFeeFromAmount, allowReplaceByFee);
        }

        public string GetNewAddress(string account = "", string addressType = "")
        {
            return string.IsNullOrWhiteSpace(account)
                ? _restRequestClient.MakeRequest<string>(RestMethods.getnewaddress)
                : _restRequestClient.MakeRequest<string>(RestMethods.getnewaddress, account, addressType);
        }
    }
}
