using System.Collections.Generic;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Services
{
    public class CoinManager : ICoinManager
    {
        private List<ICoinService> _coinServices;
        private IBitcoinCashService _bitcoinCashService;
        private IBitcoinService _bitcoinService;
        private IDashService _dashService;
        private IDogecoinService _dogecoinService;
        private ILitecoinService _litecoinService;

        public List<ICoinService> CoinServices => _coinServices;

        public IBitcoinCashService BitcoinCash => _bitcoinCashService;

        public IBitcoinService Bitcoin => _bitcoinService;

        public IDashService Dash => _dashService;

        public IDogecoinService Dogecoin => _dogecoinService;

        public ILitecoinService Litecoin => _litecoinService;

        public CoinManager(IBitcoinCashService bitcoinCash,
            IBitcoinService bitcoin,
            IDashService dash,
            IDogecoinService dogecoin,
            ILitecoinService litecoin)
        {
            _bitcoinCashService = bitcoinCash;
            _bitcoinService = bitcoin;
            _dashService = dash;
            _dogecoinService = dogecoin;
            _litecoinService = litecoin;

            _coinServices = new List<ICoinService>();

            _coinServices.Add(bitcoinCash);
            _coinServices.Add(bitcoin);
            _coinServices.Add(dash);
            _coinServices.Add(dogecoin);
            _coinServices.Add(litecoin);
        }
    }
}
