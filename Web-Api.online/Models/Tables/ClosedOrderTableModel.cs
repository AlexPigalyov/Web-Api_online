using System;
using System.ComponentModel.DataAnnotations;

using Web_Api.online.Models.Enums;

namespace Web_Api.online.Models.Tables
{
    public class ClosedOrderTableModel
    {
        [Key]
        public long ClosedOrderId { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ClosedDate { get; set; }
        public bool IsBuy { get; set; }
        public decimal StartPrice { get; set; }
        public decimal Difference { get; set; }
        public decimal ClosedPrice { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public ClosedOrderStatusEnum Status { get; set; }
        public string CreateUserId { get; set; }
        public string BoughtUserId { get; set; }
        public string Currency1 { get; set; }
        public string Currency2 { get; set; }
        public string Pair { get; set; }
    }
}
