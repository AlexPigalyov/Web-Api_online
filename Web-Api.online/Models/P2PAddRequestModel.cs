using System.Collections.Generic;

namespace Web_Api.online.Models;

public class P2PAddRequestModel
{
    public int CryptId { get; set; }
    public int FiatId { get; set; }
    public bool IsBuy { get; set; }
    public int LimitFrom { get; set; }
    public decimal LimitTo { get; set; }
    public List<int> PaymentIds { get; set; }
    public decimal Price { get; set; }
    public decimal TotalAmount { get; set; }
    public int TimeFrameId { get; set; }
}