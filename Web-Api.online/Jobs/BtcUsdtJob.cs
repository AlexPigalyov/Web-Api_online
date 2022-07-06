using Microsoft.AspNetCore.SignalR;

using Newtonsoft.Json;

using Quartz;

using System.Collections.Generic;
using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Jobs.Abstract;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class BtcUsdtJob : PairJobBase<BtcUsdtHub>, IJob
    {
        public BtcUsdtJob(TradeRepository tradeRepository, IHubContext<BtcUsdtHub> hubcontext)
            : base(hubcontext, tradeRepository, "BTC_USDT")
        {
        }
    }
}
