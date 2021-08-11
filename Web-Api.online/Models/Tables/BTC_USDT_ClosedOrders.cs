using System.ComponentModel.DataAnnotations;

namespace Web_Api.online.Models.Tables
{
    public class BTC_USDT_ClosedOrders
    {
        [Key]
        public long ClosedOrderId { get; set; }
        public System.DateTime CreateDate { get; set; }
        public System.DateTime ClosedDate { get; set; }
        public bool IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public string CreateUserId { get; set; }
        public string BoughtUserId { get; set; }
    }
}
