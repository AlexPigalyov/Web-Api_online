namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetOpenOrders_ByCreateUserIdWithOrderByDescCreateDate
    {
        public long Id { get; set; }
        public string Pair { get; set; }
        public System.DateTime CreateDate { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public string CreateUserId { get; set; }
        public bool IsBuy { get; set; }
    }
}
