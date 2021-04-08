using System;
using System.Collections.Generic;

#nullable disable

namespace Web_Api.online.Models.Tables
{
    public partial class Rate
    {
        public long Id { get; set; }
        public string Acronim { get; set; }
        public string Site { get; set; }
        public double Buy { get; set; }
        public double Sell { get; set; }
        public DateTime Date { get; set; }
        public bool? IsUp { get; set; }
    }
}
