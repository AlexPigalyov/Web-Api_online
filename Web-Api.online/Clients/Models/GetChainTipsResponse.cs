namespace Web_Api.online.Clients.Models
{
    public class GetChainTipsResponse
    {
        public uint Height { get; set; }
        public string Hash { get; set; }
        public int BranchLen { get; set; }
        public string Status { get; set; }
    }
}
