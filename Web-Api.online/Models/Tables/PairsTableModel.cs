using System;

namespace Web_Api.online.Models.Tables
{
    public class PairsTableModel
    {
        public int Id { get; set; }
        public string Currency1 { get; set; }
        public string Currency2 { get; set; }
        public int Order { get; set; }
        public DateTime Created { get; set; }
        public string Header { get; set; }
        public string Acronim { get; set; }
        public string SQLTableName => Currency1 + "_" + Currency2;
    }
}
