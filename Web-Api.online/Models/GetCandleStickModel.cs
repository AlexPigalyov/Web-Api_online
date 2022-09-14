using System;

namespace Web_Api.online.Models
{
    public class GetCandleStickModel
    {
        public string Acronim { get; set; }
        public DateTime? DateStart { get; set; }
        public DateTime? DateEnd { get; set; }
        public string Interval { get; set; }
    }
}
