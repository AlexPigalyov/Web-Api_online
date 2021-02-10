using System;
using System.Collections.Generic;

#nullable disable

namespace Web_Api.online.Models.Tables
{
    public partial class DpdCity
    {
        public long CityId { get; set; }
        public bool CityIdSpecified { get; set; }
        public string CountryCode { get; set; }
        public string CountryName { get; set; }
        public int RegionCode { get; set; }
        public bool RegionCodeSpecified { get; set; }
        public string RegionName { get; set; }
        public string CityCode { get; set; }
        public string CityName { get; set; }
        public string Abbreviation { get; set; }
        public string IndexMin { get; set; }
        public string IndexMax { get; set; }
        public long? Population { get; set; }
        public string Settled { get; set; }
        public double? Lat { get; set; }
        public double? Lng { get; set; }
    }
}
