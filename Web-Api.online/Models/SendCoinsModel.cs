using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class SendCoinsModel
    {
        public Events EventSender { get; set; }
        public Events EventReceiver { get; set; }
        public Transfer Transfer { get; set; }
    }
}
