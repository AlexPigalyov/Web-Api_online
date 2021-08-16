using System;

namespace Web_Api.online.Models
{
    public class IncomeTransaction
    {
        public long Id { get; set; }
        public string CurrencyAcronim { get; set; }
        public string TransactionId { get; set; }
        public decimal Amount { get; set; }
        public decimal TransactionFee { get; set; }
        public string ToAddress { get; set; }
        public decimal Date { get; set; }
        public string UserId { get; set; }
        public int WalletId { get; set; }
    }
}
