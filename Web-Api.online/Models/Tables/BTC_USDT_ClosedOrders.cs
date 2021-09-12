using System;
using System.ComponentModel.DataAnnotations;

using Web_Api.online.Models.Enums;

namespace Web_Api.online.Models.Tables
{
    public class BTC_USDT_ClosedOrders
    {
        [Key]
        public long ClosedOrderId { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ClosedDate { get; set; }
        public bool IsBuy { get; set; }
        public decimal ExposedPrice { get; set; }
        public decimal Difference { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public ClosedOrderStatus Status { get; set; }
        public string CreateUserId { get; set; }
        public string BoughtUserId { get; set; }
    }
}
