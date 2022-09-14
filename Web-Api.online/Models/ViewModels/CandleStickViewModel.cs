using System.Collections.Generic;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class CandleStickViewModel
    {
        public List<CandleStickTableModel> LastCandleSticks { get; set; }
        public CandleStickTableModel CurrentCandleStick { get; set; }
    }
}
