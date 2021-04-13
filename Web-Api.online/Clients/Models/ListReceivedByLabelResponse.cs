namespace Web_Api.online.Clients.Models
{
    public class ListReceivedByLabelResponse
    {
        public string Account { get; set; }
        public double Amount { get; set; }
        public int Confirmations { get; set; }
        public bool? InvolvesWatchOnly { get; set; }
        public string Label { get; set; }
    }
}
