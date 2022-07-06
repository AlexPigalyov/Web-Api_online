using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class EthBtcJob : PairJobBase<EthBtcHub>, IJob
    {
        public EthBtcJob(IHubContext<EthBtcHub> hubContext, TradeRepository tradeRepository)
            : base(hubContext, tradeRepository, "ETH_BTC")
        {
        }
    }
}