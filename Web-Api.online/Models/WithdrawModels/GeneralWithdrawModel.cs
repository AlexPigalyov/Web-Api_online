using System.ComponentModel.DataAnnotations;

namespace Web_Api.online.Models.WithdrawModels
{
    public class GeneralWithdrawModel
    {
        public GeneralWithdrawModel()
        {

        }
        public GeneralWithdrawModel(string currency)
        {
            Currency = currency;
            AmountMin = 777;
            Commission = 777;
        }

        public string Status { get; set; }
        public decimal AmountMin { get; set; }
        public decimal Commission { get; set; }

        [Required]
        public string Currency { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string Amount { get; set; }
        public string Comment { get; set; }
    }
}
