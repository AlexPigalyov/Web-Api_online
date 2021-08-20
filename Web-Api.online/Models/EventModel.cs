using System;

namespace Web_Api.online.Models
{
    public class EventModel
    {
        public long Id { get; set; }
        public string UserId { get; set; }
        public int Type { get; set; }
        public string Comment { get; set; }
        public DateTime WhenDate { get; set; }
    }
}
