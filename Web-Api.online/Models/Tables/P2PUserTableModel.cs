namespace Web_Api.online.Models.Tables;

public class P2PUserTableModel
{
    public long Id { get; set; }
    public string UserId { get; set; }
    public decimal Price { get; set; }
    public long FiatId { get; set; }
    public decimal LimitFrom { get; set; }
    public decimal LimitTo { get; set; }
    public decimal Available { get; set; }
    public long CryptId { get; set; }
}