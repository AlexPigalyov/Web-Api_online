using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class DashBtcJob : PairJobBase<DashBtcHub>, IJob
    {
        public DashBtcJob(IHubContext<DashBtcHub> hubContext, TradeRepository tradeRepository)
            : base(hubContext, tradeRepository, "DASH_BTC")
        {
        }
    }
}