using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class BchUsdtJob : PairJobBase<BchUsdtHub>, IJob
    {
        public BchUsdtJob(IHubContext<BchUsdtHub> hubContext, TradeRepository tradeRepository)
            : base(hubContext, tradeRepository, "BCH_USDT")
        {
        }
    }
}