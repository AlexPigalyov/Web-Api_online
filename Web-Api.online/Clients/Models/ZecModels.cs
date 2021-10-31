using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Clients.Models.ZecModels
{


    public record ZecBalance(int balance, int recieved);

    public record ZecSendToAddressData(string address, float amount);

    public record ZecAddressListResult(string Source, Dictionary<string, List<string>> Transparent);


}
