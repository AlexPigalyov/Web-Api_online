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
    public class TradeJob : IJob
    {
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<btcusdtHub> _hubcontext;
        private readonly PairsRepository _pairsRepository;

        public TradeJob(
            TradeRepository tradeRepository,
            IHubContext<btcusdtHub> hubcontext,
            PairsRepository pairsRepository)
        {
            _tradeRepository = tradeRepository;
            _hubcontext = hubcontext;
            _pairsRepository = pairsRepository;
        }

        public async Task Execute(IJobExecutionContext context)
        {
            var pairs = await _pairsRepository.GetAllPairsAsync();

            pairs.ForEach(x =>
            {
                var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync(x.SQLTableName).Result;
                var openOrdersSell = _tradeRepository.GetSellOrderBookAsync(x.SQLTableName).Result;
                var marketTrades = _tradeRepository.GetClosedOrders_Top100(x.SQLTableName).Result;

                var recieveResult = new RecieveMessageResultModel()
                {
                    OrderBookBuy = openOrdersBuy,
                    OrderBookSell = openOrdersSell,
                    MarketTrades = marketTrades
                };

                _hubcontext.Clients.All.SendAsync($"ReceiveMessage-{x.Acronim}", JsonConvert.SerializeObject(recieveResult)).Wait();
            });
        }
    }
}
