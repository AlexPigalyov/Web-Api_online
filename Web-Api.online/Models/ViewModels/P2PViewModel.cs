using System.Collections.Generic;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels;

public class P2PViewModel
{
    public bool IsBuy { get; set; }
    public List<P2PCryptTableModel> Crypts { get; set; }
    public List<P2PSellerModel> P2PUsers { get; set; }
    public List<P2PFiatTableModel> Fiats { get; set; }
    public List<P2PPaymentTableModel> Payments { get; set; }
    public List<P2PTimeFramesTableModel> TimeFrames { get; set; }
}