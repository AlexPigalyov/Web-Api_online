using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class LtcBtcJob : PairJobBase<LtcBtcHub>, IJob
    {
        public LtcBtcJob(IHubContext<LtcBtcHub> hubContext, TradeRepository tradeRepository)
            : base(hubContext, tradeRepository, "LTC_BTC")
        {
        }
    }
}