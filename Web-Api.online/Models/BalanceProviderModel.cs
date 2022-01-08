namespace Web_Api.online.Models
{
    public class BalanceProviderModel
    {
        public decimal? PercentCommission { get; set; }
        public decimal? Commission { get; set; }
        public decimal StartBalanceSender { get; set; }
        public decimal ResultBalanceSender { get; set; }
        public decimal? StartBalanceReceiver { get; set; }
        public decimal? ResultBalanceReceiver { get; set; }
    }
}
