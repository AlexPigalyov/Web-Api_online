using System;
using Web_Api.online.Models.Enums;

namespace Web_Api.online.Models
{
    public class EventModel
    {
        public long Id { get; set; }
        public string UserId { get; set; }
        public EventType Type { get; set; }
        public decimal Value { get; set; }
        public string Comment { get; set; }
        public DateTime? WhenDate { get; set; }
    }
}
