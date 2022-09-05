using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Models;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class EthBtcJob : IJob
    {
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<EthBtcHub> _hubContext;
        public EthBtcJob(TradeRepository tradeRepository)
        {
            _tradeRepository = tradeRepository;
        }
        
        public async Task Execute(IJobExecutionContext context)
        {
            var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync("ETH_BTC").Result;
            var openOrdersSell = _tradeRepository.GetSellOrderBookAsync("ETH_BTC").Result;
            var marketTrades = _tradeRepository.GetClosedOrders_Top100("ETH_BTC").Result;

            var recieveResult = new RecieveMessageResultModel()
            {
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades
            };

            _hubContext.Clients?.All.SendAsync($"ReceiveMessage", JsonConvert.SerializeObject(recieveResult)).Wait();
        }
    }
}