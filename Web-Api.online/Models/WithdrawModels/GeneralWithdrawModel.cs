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
            AmountMin = 0.00000001m;
            Commission = 0;
        }

        public string Status { get; set; }
        public decimal AmountMin { get; set; }
        public decimal Commission { get; set; }

        [Required]
        public string Currency { get; set; }

        public decimal Balance { get; set; }    
        [Required]
        public string Address { get; set; }
        [Required]
        public string Amount { get; set; }
        public string Comment { get; set; }
    }
}
