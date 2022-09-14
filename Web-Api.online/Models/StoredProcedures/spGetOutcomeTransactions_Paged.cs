using System;

namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetOutcomeTransactions_Paged
    {
        public string CurrencyAcronim { get; set; }
        public decimal Value { get; set; }
        public DateTime CreateDate { get; set; }
        public string FromAddress { get; set; }
        public string ToAddress { get; set; }
        public int State { get; set; }
        public DateTime LastUpdateDate { get; set; }
        public string ErrorText { get; set; }
    }
}