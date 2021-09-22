using System;

namespace Web_Api.online.Models.Tables
{
    public partial class CurrencyTableModel
    {
        public int Id { get; set; }
        public string Acronim { get; set; }
        public string Name { get; set; }
        public DateTime Created { get; set; }
    }
}
