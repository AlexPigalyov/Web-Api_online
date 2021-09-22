using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models
{
    public class SendCoinsModel
    {
        public EventTableModel EventSender { get; set; }
        public EventTableModel EventReceiver { get; set; }
        public TransferTableModel Transfer { get; set; }
    }
}
