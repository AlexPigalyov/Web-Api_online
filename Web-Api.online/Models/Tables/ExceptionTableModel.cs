using System;

namespace Web_Api.online.Models.Tables
{
    public class ExceptionTableModel
    {
        public int Id { get; set; }
        public string Value { get; set; }
        public DateTime WhenDate { get; set; }
        public string UserId { get; set; }
    }
}