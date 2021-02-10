using System;
using System.Collections.Generic;

#nullable disable

namespace Web_Api.online.Models.Tables
{
    public partial class Rate
    {
        public long Id { get; set; }
        public DateTime Date { get; set; }
        public string Value { get; set; }
    }
}
