using System;

namespace Web_Api.online.Models.Tables
{
    public class Events
    {
        public long Id { get; set; }
        public string UserId { get; set; }
        public int Type { get; set; }
        public decimal Value { get; set; }
        public string Comment { get; set; }
        public DateTime WhenDate { get; set; }
        public string CurrencyAcronim { get; set; }
    }
}
