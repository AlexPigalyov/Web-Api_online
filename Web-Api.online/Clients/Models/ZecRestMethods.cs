using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Clients.Models
{
    public enum ZecRestMethods
    {
        sendtoaddress,
        getnewaddress,
        listaddresses,
        getaddressbalance,
        getaddressdeltas,
        z_sendmany,

    }
}
