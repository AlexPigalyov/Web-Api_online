using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class WalletsViewModel
    {
        public List<WalletViewModel> Wallets { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }

    public class WalletViewModel
    {
        public int Id { get; set; }
        public string CurrencyAcronim { get; set; }
        public DateTime Created { get; set; }
        public string Address { get; set; }
    }
}
