using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Clients.Models
{
    public record ZecSendToAddressData 
    { 
        public string Address { get; set; }
        public float Amount { get; set; }
    }

}
