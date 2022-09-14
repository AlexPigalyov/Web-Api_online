using System.Collections.Generic;

namespace Web_Api.online.Models;

public class P2PAddRequestModel
{
    public string Crypt { get; set; }
    public string Fiat { get; set; }
    public bool IsBuy { get; set; }
    public int LimitFrom { get; set; }
    public decimal LimitTo { get; set; }
    public List<string> Payments { get; set; }
    public decimal Price { get; set; }
    public decimal TotalAmount { get; set; }
    public string TimeFrame { get; set; }
}