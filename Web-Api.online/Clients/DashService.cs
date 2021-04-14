using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;

namespace Web_Api.online.Clients
{
    public class DashService : CoinService, IDashService
    {
        public DashService(IConfiguration configuration, bool useTestnet = false) : base(configuration, useTestnet) { }

        public DashService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword,
            string walletPassword) : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword) { }

        public DashService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword,
            string walletPassword, short rpcRequestTimeoutInSeconds) : base(configuration, daemonUrl, rpcUsername,
            rpcPassword, walletPassword, rpcRequestTimeoutInSeconds)
        { }

        /// <summary>
        /// Adds InstantSend and PrivateSend to SendToAddress from our wallet.
        /// </summary>
        /// <inheritdoc />
        public string SendToAddress(string dashAddress, decimal amount, string comment = null,
            string commentTo = null, bool subtractFeeFromAmount = false, bool useInstantSend = false,
            bool usePrivateSend = false)
            => _restRequestClient.MakeRequest<string>(RestMethods.sendtoaddress, dashAddress, amount,
                comment, commentTo, subtractFeeFromAmount, useInstantSend, usePrivateSend);

        /// <summary>
        /// Adds InstantSend support to SendRawTransaction
        /// </summary>
        public string SendRawTransaction(string rawTransactionHexString, bool allowHighFees,
            bool useInstantSend)
            => _restRequestClient.MakeRequest<string>(RestMethods.sendrawtransaction, rawTransactionHexString,
                allowHighFees, useInstantSend);

        public SignRawTransactionWithErrorResponse SignRawTransactionWithErrorSupport(
            SignRawTransactionRequest request)
        {
            if (request.Inputs.Count == 0)
                request.Inputs = null;
            if (string.IsNullOrWhiteSpace(request.SigHashType))
                request.SigHashType = "ALL";
            if (request.PrivateKeys.Count == 0)
                request.PrivateKeys = null;
            return _restRequestClient.MakeRequest<SignRawTransactionWithErrorResponse>(
                RestMethods.signrawtransaction, request.RawTransactionHex, request.Inputs,
                request.PrivateKeys, request.SigHashType);
        }

        /// <summary>
        /// privatesend "command"
        /// Arguments:
        /// 1. "command"        (string or set of strings, required) The command to execute
        /// Available commands:
        /// start       - Start mixing
        /// stop        - Stop mixing
        /// reset       - Reset mixing
        /// </summary>
        public string SendPrivateSendCommand(string command)
            => _restRequestClient.MakeRequest<string>(RestMethods.privatesend, command);

        public AddressBalanceResponse GetAddressBalance(AddressBalanceRequest addresses)
            => _restRequestClient.MakeRequest<AddressBalanceResponse>(RestMethods.getaddressbalance, addresses);

        /// <summary>
        /// Extends unspend result to show ps_rounds to check for available mixed PrivateSend amount.
        /// </summary>
        public List<ListUnspentDashResponse> ListUnspentPrivateSend()
            => _restRequestClient.MakeRequest<List<ListUnspentDashResponse>>(RestMethods.listunspent,
                1, 9999999, new List<string>());

        public DashConstants.Constants Constants => DashConstants.Constants.Instance;

        public List<MasternodeResponse> MasternodeList()
        {
            var response = _restRequestClient.MakeRequest<JObject>(RestMethods.masternode, "list");
            var result = new List<MasternodeResponse>();
            foreach (var data in response)
                result.Add(data.Value.ToObject<MasternodeResponse>());
            return result;
        }
    }
}
