using Microsoft.AspNetCore.SignalR;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;

namespace Web_Api.online.Jobs;

public class BchBtcJob : PairJobBase<BchBtcHub>, IJob
{
    public BchBtcJob(TradeRepository tradeRepository, IHubContext<BchBtcHub> hubcontext)
        : base(hubcontext, tradeRepository, "BCH_BTC")
    {
    }
}