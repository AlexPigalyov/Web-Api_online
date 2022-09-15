namespace Web_Api.online.Models.Tables;

public class P2PUserTableModel
{
    public long Id { get; set; }
    public string UserId { get; set; }
    public decimal Price { get; set; }
    public int P2PFiatId { get; set; }
    public decimal LimitFrom { get; set; }
    public decimal LimitTo { get; set; }
    public decimal Available { get; set; }
    public int P2PCryptId { get; set; }
    public int P2PTimeFrameId { get; set; }
}