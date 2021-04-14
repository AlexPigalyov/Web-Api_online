namespace Web_Api.online.Clients.Models
{
    public static class BitcoinConstants
    {
        public sealed class Constants : CoinConstants<Constants>
        {
            public readonly int OneBitcoinInSatoshis = 100000000;
            public readonly decimal OneSatoshiInBTC = 0.00000001M;
            public readonly int SatoshisPerBitcoin = 100000000;
            public readonly string Symbol = "฿";

            #region Custom constructor example - commented out on purpose

            //private static readonly Lazy<Constants> Lazy = new Lazy<Constants>(() => new Constants());

            //public static Constants Instance
            //{
            //    get
            //    {
            //        return Lazy.Value;
            //    }
            //}

            //private Constants()
            //{
            //  //  custom logic here
            //}

            #endregion
        }
    }
}
