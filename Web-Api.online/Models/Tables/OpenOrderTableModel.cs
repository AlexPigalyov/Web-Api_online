using System.ComponentModel.DataAnnotations;

namespace Web_Api.online.Models.Tables
{
    public class OpenOrderTableModel
    {
        public long Id { get; set; }
        public System.DateTime CreateDate { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Total { get; set; }
        public string CreateUserId { get; set; }
        public string CryptExchangePair { get; set; }
    }
}
