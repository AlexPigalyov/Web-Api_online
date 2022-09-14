namespace Web_Api.online.Models.StoredProcedures
{
    public class spProcessOrderResult
    {
        public decimal Amount { get; set; }
        public long Id { get; set; }
        public string ClosedOrderUserId { get; set; }
        public long ClosedOrderId { get; set; }
    }
}
