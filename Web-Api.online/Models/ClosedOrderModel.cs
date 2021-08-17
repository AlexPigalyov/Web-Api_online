using Web_Api.online.Models.Enums;

namespace Web_Api.online.Models
{
    public class ClosedOrderModel
    {
        public System.DateTime CreateDate { get; set; }
        public System.DateTime ClosedDate { get; set; }
        public bool IsBuy { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public ClosedOrderStatus Status { get; set; }
    }
}
