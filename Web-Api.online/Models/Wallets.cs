using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Models
{
    public class Wallets
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public int CurrencyId { get; set; }
        public string WalletAddress { get; set; }
        public decimal Value { get; set; }

    }
}
