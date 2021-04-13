using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class GetAddedNodeInfoResponse
    {
        public string AddedNode { get; set; }
        public bool Connected { get; set; }
        public List<NodeAddress> Addresses { get; set; }
    }
}
