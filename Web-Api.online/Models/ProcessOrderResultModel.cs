using System.Collections.Generic;

namespace Web_Api.online.Models
{
    public class ProcessOrderResultModel
    {
        public List<UpdatedOrderModel> UpdatedOrders { get; set; }
        public bool IsCurrentOrderClosed { get; set; }
    }
}
