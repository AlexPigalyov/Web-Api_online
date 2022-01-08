using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class SendCoinsModel
    {
        public string SenderUserId { get; set; }
        public string ReceiverUserId { get; set; }
        public int TypeSender { get; set; }
        public int TypeRecieve { get; set; }
        public string Comment { get; set; }
        public string CurrencyAcronim { get; set; }
        public decimal Value { get; set; }
        public decimal? PlatformCommission { get; set; }
        public decimal StartBalanceSender { get; set; }
        public decimal ResultBalanceSender { get; set; }
        public decimal StartBalanceReceiver { get; set; }
        public decimal ResultBalanceReceiver { get; set; }
        public int SenderWalletId { get; set; }
        public int ReceiverWalletId { get; set; }
        public string Hash { get; set; }
    }
}
