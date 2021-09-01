namespace Web_Api.online.Models.WithdrawModels
{
    public class LTCWithdrawModel : GeneralWithdrawModel
    {
        public LTCWithdrawModel()
        {
            Currency = "LTC";
            AmountMin = 777;
            Commission = 777;
        }
    }
}
