using System;

namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetIncomeTransactions_Paged
    {
        public string CurrencyAcronim { get; set; }
        public string Amount { get; set; }
        public decimal TransactionFee { get; set; }
        public string FromAddress { get; set; }
        public DateTime Date { get; set; }
        public string UserId { get; set; }
    }
}