using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class SendCoinsModel
    {
        public Wallet WalletSender { get; set; }
        public Wallet WalletReceiver { get; set; }
        public Events EventSender { get; set; }
        public Events EventReceiver { get; set; }
    }
}
