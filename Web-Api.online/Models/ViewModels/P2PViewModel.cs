using System.Collections.Generic;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels;

public class P2PViewModel
{
    public List<CryptTableModel> Crypts { get; set; }
    public List<P2PSellerModel> P2PSellers { get; set; }
}