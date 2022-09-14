using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class GetAddressInfoResponse
    {
        public string Address { get; set; }
        public string ScriptPubKey { get; set; }
        public bool IsMine { get; set; }
        public bool IsWatchOnly { get; set; }
        public bool IsScript { get; set; }
        public bool IsWitness { get; set; }
        public List<LabelDetails> Labels { get; set; }
    }
}
