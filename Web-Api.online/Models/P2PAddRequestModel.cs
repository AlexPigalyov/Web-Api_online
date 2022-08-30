namespace Web_Api.online.Models;

public class P2PAddRequestModel
{
    public bool IsBuy { get; set; }
    public string Crypt { get; set; }
    public string Fiat { get; set; }
    public decimal Price { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal LimitFrom { get; set; }
    public decimal LimitTo { get; set; }
    public string Payment { get; set; }
}