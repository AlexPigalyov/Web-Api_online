namespace Web_Api.online.Models.StoredProcedures
{
    public class Args_spAdd_BTC_USDT_OpenOrder
    {
        public string UserId { get; set; }
        public bool IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
    }
}
