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
    public class DashUsdtJob : IJob
    {
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<DashUsdtHub> _hubContext;
        public DashUsdtJob(TradeRepository tradeRepository)
        {
            _tradeRepository = tradeRepository;
        }
        
        public async Task Execute(IJobExecutionContext context)
        {
            var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync("DASH_USDT").Result;
            var openOrdersSell = _tradeRepository.GetSellOrderBookAsync("DASH_USDT").Result;
            var marketTrades = _tradeRepository.GetClosedOrders_Top100("DASH_USDT").Result;

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