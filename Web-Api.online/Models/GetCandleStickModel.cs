using System;

namespace Web_Api.online.Models
{
    public class GetCandleStickModel
    {
        public DateTime? DateStart { get; set; }
        public DateTime? DateEnd { get; set; }
        public string Interval { get; set; }
    }
}
