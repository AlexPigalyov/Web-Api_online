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
    public class BchUsdtJob : IJob
    {
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<BchUsdtHub> _hubContext;
        public BchUsdtJob(TradeRepository tradeRepository, IHubContext<BchUsdtHub> hubContext)
        {
            _tradeRepository = tradeRepository;
            _hubContext = hubContext;
        }
        
        public async Task Execute(IJobExecutionContext context)
        {
            var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync("BCH_USDT").Result;
            var openOrdersSell = _tradeRepository.GetSellOrderBookAsync("BCH_USDT").Result;
            var marketTrades = _tradeRepository.GetClosedOrders_Top100("BCH_USDT").Result;

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