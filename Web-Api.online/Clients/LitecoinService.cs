using Microsoft.Extensions.Configuration;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;

namespace Web_Api.online.Clients
{
    public class LitecoinService : CoinService, ILitecoinService
    {
        public LitecoinService(IConfiguration configuration, bool useTestnet = false) : base(configuration, useTestnet)
        {
        }

        public LitecoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword = null)
            : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword)
        {
        }

        public LitecoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword, short rpcRequestTimeoutInSeconds)
            : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword, rpcRequestTimeoutInSeconds)
        {
        }

        public LitecoinConstants.Constants Constants => LitecoinConstants.Constants.Instance;
    }
}
