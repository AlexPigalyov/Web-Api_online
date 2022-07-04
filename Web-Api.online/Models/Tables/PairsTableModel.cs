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

        public decimal Price { get; set; }
        public DateTime PriceUpdateDate { get; set; }

        public decimal Change24h { get; set; }
        public DateTime Change24hUpdateDate { get; set; }

        public decimal Change1h { get; set; }
        public DateTime Change1hUpdateDate { get; set; }

        public decimal Volume24h { get; set; }
        public DateTime Volume24hUpdateDate { get; set; }

        public string SQLTableName => Currency1 + "_" + Currency2;
        public string ImgUrl { get; set; }
    }
}
