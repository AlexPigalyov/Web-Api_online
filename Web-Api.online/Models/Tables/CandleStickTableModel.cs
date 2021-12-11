using System;

namespace Web_Api.online.Models.Tables
{
    public class CandleStickTableModel
    {
        public decimal Close { get; set; }
        public DateTime CloseTime { get; set; }
        public long CloseTimeStamp => CloseTime > DateTime.MinValue ? ((DateTimeOffset)CloseTime).ToUnixTimeSeconds() : 0;
        public decimal High { get; set; }
        public decimal Low { get; set; }
        public decimal Open { get; set; }
        public DateTime OpenTime { get; set; }
        public long OpenTimeStamp => OpenTime > DateTime.MinValue ? ((DateTimeOffset)OpenTime).ToUnixTimeSeconds() : 0;
    }
}
