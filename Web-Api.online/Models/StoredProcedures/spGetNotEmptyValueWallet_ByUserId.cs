﻿namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetNotEmptyValueWallet_ByUserId
    {
        public string UserId { get; set; }
        public string CurrencyAcronim { get; set; }
        public decimal Value { get; set; }
    }
}
