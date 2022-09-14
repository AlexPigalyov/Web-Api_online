using System.Collections.Generic;
using Web_Api.online.Models.StoredProcedures;

namespace Web_Api.online.Models
{
    public class NewsPageModel
    {
        public List<spGetNews> NewsList { get; set; }
    }
}
