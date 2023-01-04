namespace Web_Api.online.Models.Enums
{
    public enum EventTypeEnum
    {
        Registration = 1,
        Income = 2,
        Withdraw = 3,
        Send = 4,
        Recieve = 5,
        CreateAddress = 6,
        CreateWallet = 7,
        CommissionForIncomeTransaction = 8,
        CommissionForTransfer = 9,
        CommissionForOutcomeTransaction = 9,
        CommissionForTrade = 10,
        OutcomeTransactionError = 11,
        RegistrationByRefferalLink = 12,

        CreateOrder = 20,
        CancelOrder = 21
    }
}
