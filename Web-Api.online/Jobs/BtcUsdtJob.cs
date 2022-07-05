using Microsoft.AspNetCore.SignalR;

using Newtonsoft.Json;

using Quartz;

using System.Collections.Generic;
using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class BtcUsdtJob : IJob
    {
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<BtcUsdtHub> _hubcontext;

        public BtcUsdtJob(
            TradeRepository tradeRepository,
            IHubContext<BtcUsdtHub> hubcontext)
        {
            _tradeRepository = tradeRepository;
            _hubcontext = hubcontext;
        }

        public async Task Execute(IJobExecutionContext context)
        {
            var sQLTableName = "BTC_USDT";

            var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync(sQLTableName).Result;
            var openOrdersSell = _tradeRepository.GetSellOrderBookAsync(sQLTableName).Result;
            var marketTrades = _tradeRepository.GetClosedOrders_Top100(sQLTableName).Result;

            var recieveResult = new RecieveMessageResultModel()
            {
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades
            };

            _hubcontext.Clients.All.SendAsync($"ReceiveMessage-BTCUSDT", JsonConvert.SerializeObject(recieveResult)).Wait();

        }
    }
}
