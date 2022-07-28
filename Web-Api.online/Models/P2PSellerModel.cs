using System.Collections.Generic;

namespace Web_Api.online.Models;

public class P2PSellerModel
{
    public string UserName { get; set; }
    public decimal Price { get; set; }
    public string FiatName { get; set; }
    public decimal LimitFrom { get; set; }
    public decimal LimitTo { get; set; }
    public decimal Available { get; set; }
    public List<string> Payments { get; set; }
    public string CryptName { get; set; }
}