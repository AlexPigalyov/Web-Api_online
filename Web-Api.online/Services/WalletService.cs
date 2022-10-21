using System;
using Web_Api.online.Clients;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Hash;

namespace Web_Api.online.Services
{
    public class WalletService
    {
        public IBitcoinCashService _bitcoinCashService { get; }
        public IBitcoinService _bitcoinService { get; }
        public IDashService _dashService { get; }
        public IDogecoinService _dogecoinService { get; }
        public ILitecoinService _litecoinService { get; }

        private EtheriumService _etheriumService { get; set; }
        private ZCashService  _zCashService { get; set; }


        public WalletService(EtheriumService etheriumService,
            ZCashService zCashService,
            ILitecoinService litecoinService,
            IDogecoinService dogecoinService,
            IDashService dashService,
            IBitcoinService bitcoinService,
            IBitcoinCashService bitcoinCashService)
        {
            _etheriumService = etheriumService;
            _zCashService = zCashService;
            _litecoinService = litecoinService;
            _dogecoinService = dogecoinService;
            _dashService = dashService;
            _bitcoinService = bitcoinService;
            _bitcoinCashService = bitcoinCashService;
        }

        public string GetNewAddress(string acronim, string lable)
        {
            return acronim switch
            {
                "USDT" => GenerateHash.sha256(lable + "USDT" + DateTime.Now.ToString()),
                "ETH" => _etheriumService.GetNewAddressAsync(lable).Result,
                "ZEC" => _zCashService.GetNewAddress(),
                "LTC" => _litecoinService.GetNewAddress(lable),
                "DOGE" => _dogecoinService.GetNewAddress(lable),
                "DASH" => _dashService.GetNewAddress(lable),
                "BTC" => _bitcoinService.GetNewAddress(lable),
                "BCH" => _bitcoinCashService.GetNewAddress(lable),
                _ => null
            };
        }
    }
}
