using System;

namespace Web_Api.online.Models.Tables
{
    public class TransferTableModel
    {
        public long Id { get; set; }
        public int WalletFromId { get; set; }
        public int WalletToId { get; set; }
        public decimal Value { get; set; }
        public decimal? PlatformCommission { get; set; }
        public DateTime Date { get; set; }
        public string CurrencyAcronim { get; set; }
        public string Hash { get; set; }
        public string Comment { get; set; }
    }
}
