using System;

namespace Web_Api.online.Models
{
    public class CashIns
    {
        public int UserNumber { get; set; }
        public double Value { get; set; }
        public string Sposob { get; set; }
        public DateTime WhenDate { get; set; }
        public string AcceptedAccount { get; set; }
        public string SendAccount { get; set; }
    }
}
