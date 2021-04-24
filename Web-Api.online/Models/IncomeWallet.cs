using System;

namespace Web_Api.online.Models
{
    public class IncomeWallet
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string CurrencyAcronim { get; set; }
        public string WalletAddress { get; set; }
        public decimal Value { get; set; }
        public DateTime Created { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
