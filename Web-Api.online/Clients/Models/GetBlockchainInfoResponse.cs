namespace Web_Api.online.Clients.Models
{
    public class GetBlockchainInfoResponse
    {
        public string Chain { get; set; }
        public ulong Blocks { get; set; }
        public ulong Headers { get; set; }
        public string BestBlockHash { get; set; }
        public double Difficulty { get; set; }
        public double VerificationProgress { get; set; }
        public string ChainWork { get; set; }
        public bool Pruned { get; set; }
    }
}
