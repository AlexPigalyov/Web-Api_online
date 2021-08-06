using System;

namespace Web_Api.online.Models
{
    /// <summary>
    /// Кошелёк внутренних переводов только внутри нашей системы. В блокчейне не создаётся.
    /// </summary>
    public class Wallet
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string CurrencyAcronim { get; set; }
        public decimal Value { get; set; }
        public DateTime Created { get; set; }
        public DateTime LastUpdate { get; set; }
        public string Address { get; set; }
    }
}
