using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class DogeBtcJob : PairJobBase<DogeBtcHub>, IJob
    {
        public DogeBtcJob(IHubContext<DogeBtcHub> hubContext, TradeRepository tradeRepository, string sqlTableName)
            : base(hubContext, tradeRepository, sqlTableName)
        {
        }
    }
}