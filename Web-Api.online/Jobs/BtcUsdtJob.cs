using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Quartz;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Models;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class BtcUsdtJob : IJob
    {
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<BtcUsdtHub> _hubContext;
        public BtcUsdtJob(TradeRepository tradeRepository, IHubContext<BtcUsdtHub> hubContext)
        {
            _tradeRepository = tradeRepository;
            _hubContext = hubContext;
        }
        
        public async Task Execute(IJobExecutionContext context)
        {
            var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync("BTC_USDT").Result;
            var openOrdersSell = _tradeRepository.GetSellOrderBookAsync("BTC_USDT").Result;
            var marketTrades = _tradeRepository.GetClosedOrders_Top100("BTC_USDT").Result;

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
