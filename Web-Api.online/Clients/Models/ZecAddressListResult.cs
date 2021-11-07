using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Clients.Models
{
    public class ZecAddressListResult 
    { 
       public string Source { get; set; }
       public Dictionary<string, List<string>> Transparent { get; set; }
    }

}
