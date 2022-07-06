using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs;

public class DogeUsdtJob : PairJobBase<DogeUsdtHub>, IJob
{
    public DogeUsdtJob(IHubContext<DogeUsdtHub> hubContext, TradeRepository tradeRepository) 
        : base(hubContext, tradeRepository, "DOGE_USDT")
    {
    }
}