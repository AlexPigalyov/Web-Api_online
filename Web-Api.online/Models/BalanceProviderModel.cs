using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class BalanceProviderModel
    {
        public decimal? PercentCommission { get; set; }
        public decimal? Commission { get; set; }
        public decimal StartBalance { get; set; }
        public decimal ResultBalance { get; set; }
    }
}
