using System;
using Web_Api.online.Clients;
using Web_Api.online.Clients.Interfaces;

namespace Web_Api.online.Services
{
    public class WalletService
    {
        public IBitcoinCashService bitcoinCashService { get; }
        public IBitcoinService bitcoinService { get; }
        public IDashService dashService { get; }
        public IDogecoinService dogecoinService { get; }
        public ILitecoinService litecoinService { get; }

        private EtheriumService etheriumService { get; set; }
        private ZCashService  zCashService { get; set; }


        public WalletService(EtheriumService etheriumService,
            ZCashService zCashService,
            ILitecoinService litecoinService,
            IDogecoinService dogecoinService,
            IDashService dashService,
            IBitcoinService bitcoinService,
            IBitcoinCashService bitcoinCashService)
        {
            this.etheriumService = etheriumService;
            this.zCashService = zCashService;
            this.litecoinService = litecoinService;
            this.dogecoinService = dogecoinService;
            this.dashService = dashService;
            this.bitcoinService = bitcoinService;
            this.bitcoinCashService = bitcoinCashService;
        }

        public string GetNewAddress(string acronim, string lable)
        {
            return acronim switch
            {
                "ETH" => etheriumService.GetNewAddress(lable),
                "ZEC" => zCashService.GetNewAddress(),
                "LTC" => litecoinService.GetNewAddress(lable),
                "DOGE" => dogecoinService.GetNewAddress(lable),
                "DASH" => dashService.GetNewAddress(lable),
                "BTC" => bitcoinService.GetNewAddress(lable),
                "BTH" => bitcoinCashService.GetNewAddress(lable),
                _ => null
            };
        }
    }
}
