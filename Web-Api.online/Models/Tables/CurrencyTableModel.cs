using System;

namespace Web_Api.online.Models.Tables
{
    public class CurrencyTableModel
    {
        public int Id { get; set; }
        public string Acronim { get; set; }
        public string Name { get; set; }
        public DateTime Created { get; set; }
        public decimal? PercentCommissionForIncomeTransaction { get; set; }
        public decimal? PercentCommissionForTransfer { get; set; }
        public decimal? PercentCommissionForOutcomeTransaction { get; set; }
        public decimal? PercentCommissionForTrade { get; set; }
        public bool NodeIsReady { get; set; }
    }
}
