using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class LtcBtcJob : Hub, IJob
    {
        private readonly TradeRepository _tradeRepository;
        public LtcBtcJob(TradeRepository tradeRepository)
        {
            _tradeRepository = tradeRepository;
        }
        
        public async Task Execute(IJobExecutionContext context)
        {
            var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync("LTC_BTC").Result;
            var openOrdersSell = _tradeRepository.GetSellOrderBookAsync("LTC_BTC").Result;
            var marketTrades = _tradeRepository.GetClosedOrders_Top100("LTC_BTC").Result;

            var recieveResult = new RecieveMessageResultModel()
            {
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades
            };

            this.Clients?.All.SendAsync($"ReceiveMessage", JsonConvert.SerializeObject(recieveResult)).Wait();
        }
    }
}