using System.Collections.Generic;
using Web_Api.online.Clients.Interfaces;

namespace Web_Api.online.Services.Interfaces
{
    public interface ICoinManager
    {
        public List<ICoinService> CoinServices { get; }

        public IBitcoinCashService BitcoinCash { get; }
        public IBitcoinService Bitcoin { get; }
        public IDashService Dash { get; }
        public IDogecoinService Dogecoin { get; }
        public ILitecoinService Litecoin { get; }
    }
}
