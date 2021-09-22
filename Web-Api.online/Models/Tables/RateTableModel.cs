using System;

namespace Web_Api.online.Models.Tables
{
    public partial class RateTableModel
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
