using System;

namespace Web_Api.online.Models
{
    public class CheckQiwiPayment
    {
        public int UserPublicId { get; set; }

        public double Amount { get; set; }

        public DateTime Date { get; set; }

        public string AcceptedAccount { get; set; }

        public string SendAccount { get; set; }
    }
}
