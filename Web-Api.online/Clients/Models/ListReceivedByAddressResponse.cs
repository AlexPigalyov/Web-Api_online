using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class ListReceivedByAddressResponse
    {
        public string Account { get; set; }
        public string Address { get; set; }
        public decimal Amount { get; set; }
        public int Confirmations { get; set; }
        public List<string> TxIds { get; set; }
    }
}
