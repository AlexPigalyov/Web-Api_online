using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Clients.Models
{
    public class ZecDeltas 
    { 
        public string Address { get; set; }
        public int BlockIndex { get; set; }
        public int Height { get; set; }
        public int Index { get; set; }
        public long Satoshis { get; set; }
        public string TxId { get; set; }
    }
}
