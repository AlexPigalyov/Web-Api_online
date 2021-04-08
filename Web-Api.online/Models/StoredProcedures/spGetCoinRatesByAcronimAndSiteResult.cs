using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetCoinRatesByAcronimAndSiteResult
    {
        public long Id { get; set; }
        public string Acronim { get; set; }
        public string Site { get; set; }
        public double Buy { get; set; }
        public double Sell { get; set; }
        public DateTime Date { get; set; }
        public bool IsUp { get; set; }
    }
}
