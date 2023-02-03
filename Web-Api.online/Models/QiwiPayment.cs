using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Api.online.Models
{
    public class QiwiPayment
    {
        public string Login { get; set; }

        public string Pwd { get; set; }

        public double Amount { get; set; }

        public string Recipient { get; set; }

        public string Comment { get; set; }
    }
}