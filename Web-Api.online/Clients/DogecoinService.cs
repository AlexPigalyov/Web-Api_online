using Microsoft.Extensions.Configuration;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Clients.Models;

namespace Web_Api.online.Clients
{
    public class DogecoinService : CoinService, IDogecoinService
    {
        public DogecoinService(IConfiguration configuration, bool useTestnet = false) : base(configuration, useTestnet)
        {
        }

        public DogecoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword)
            : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword)
        {
        }

        public DogecoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword, short rpcRequestTimeoutInSeconds)
            : base(configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword, rpcRequestTimeoutInSeconds)
        {
        }

        public DogecoinConstants.Constants Constants => DogecoinConstants.Constants.Instance;
    }
}
