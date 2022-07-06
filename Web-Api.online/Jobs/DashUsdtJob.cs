using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs;

public class DashUsdtJob : PairJobBase<DashUsdtHub>, IJob
{
    public DashUsdtJob(IHubContext<DashUsdtHub> hubContext, TradeRepository tradeRepository) 
        : base(hubContext, tradeRepository, "DASH_USDT")
    {
    }
}