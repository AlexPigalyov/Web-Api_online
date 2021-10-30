using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients.Models;

namespace Web_Api.online.Clients.Interfaces
{
    public interface IZCashService : ICoinService, IZCashConstants
    {
        string SendToAddress(string zcashAddress, decimal amount, string comment = null,
            string commentTo = null, bool subtractFeeFromAmount = false, bool useInstantSend = false,
            bool usePrivateSend = false);
    }
}
