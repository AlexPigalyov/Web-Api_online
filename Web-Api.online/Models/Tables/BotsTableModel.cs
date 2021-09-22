using System.ComponentModel.DataAnnotations;

namespace Web_Api.online.Models.Tables
{
    public class BotsTableModel
    {
        [Key]
        public long Id { get; set; }
        public string Name { get; set; }
        public string BotAuthCode { get; set; }
        public string UserId { get; set; }
    }
}
