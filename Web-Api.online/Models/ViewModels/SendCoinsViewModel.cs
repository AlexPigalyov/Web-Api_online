using System.ComponentModel.DataAnnotations;

namespace Web_Api.online.Models.ViewModels
{
    public class SendCoinsViewModel
    {
        public string Status { get; set; }
        public decimal Commission { get; set; }


        [Required]
        public string InputTextIdentifier { get; set; }
        [Required]
        public string Currency { get; set; }
        public decimal Balance { get; set; }
        [Required]
        public string Amount { get; set; }
        public string Comment { get; set; }
    }
}
