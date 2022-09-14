using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class GetNetworkInfoResponse
    {
        public uint Version { get; set; }
        public string Subversion { get; set; }
        public uint ProtocolVersion { get; set; }
        public string LocalServices { get; set; }
        public int TimeOffset { get; set; }
        public uint Connections { get; set; }
        public IList<Network> Networks { get; set; }
        public decimal RelayFee { get; set; }
        public IList<LocalAddress> LocalAddresses { get; set; }
    }

    public class LocalAddress
    {
        public string Address { get; set; }
        public ushort Port { get; set; }
        public int Score { get; set; }
    }

    public class Network
    {
        public string Name { get; set; }
        public bool Limited { get; set; }
        public bool Reachable { get; set; }
        public string Proxy { get; set; }
    }
}
