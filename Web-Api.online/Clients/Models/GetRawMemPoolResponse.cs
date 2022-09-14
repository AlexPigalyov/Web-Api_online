using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class GetRawMemPoolResponse
    {
        public GetRawMemPoolResponse()
        {
            TxIds = new List<string>();
            VerboseResponses = new List<GetRawMemPoolVerboseResponse>();
        }

        public IList<string> TxIds { get; set; }
        public bool IsVerbose { get; set; }
        public IList<GetRawMemPoolVerboseResponse> VerboseResponses { get; set; }
    }

    public class GetRawMemPoolVerboseResponse
    {
        public GetRawMemPoolVerboseResponse()
        {
            Depends = new List<string>();
        }

        public string TxId { get; set; }
        public int? Size { get; set; }
        public decimal? Fee { get; set; }
        public int? Time { get; set; }
        public int? Height { get; set; }
        public double? StartingPriority { get; set; }
        public double? CurrentPriority { get; set; }
        public IList<string> Depends { get; set; }
    }
}
