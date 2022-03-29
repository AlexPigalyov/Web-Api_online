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
    public class TradeJob : IJob
    {
        private readonly TradeRepository _tradeRepository;
        private readonly IHubContext<btcusdtHub> _hubcontext;
        public TradeJob(
            TradeRepository tradeRepository,
            IHubContext<btcusdtHub> hubcontext)
        {
            _tradeRepository = tradeRepository;
            _hubcontext = hubcontext;
        }
        public async Task Execute(IJobExecutionContext context)
        {
            List<spGetOrderByDescPriceOrderBookResult> openOrdersBuy = await _tradeRepository.Get_BTC_USDT_BuyOrderBookAsync();
            List<spGetOrderByDescPriceOrderBookResult> openOrdersSell = await _tradeRepository.Get_BTC_USDT_SellOrderBookAsync();
            List<ClosedOrderTableModel> marketTrades = await _tradeRepository.spGet_BTC_USDT_ClosedOrders_Top100();

            RecieveMessageResultModel recieveResult = new RecieveMessageResultModel()
            {
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades
            };

            await _hubcontext.Clients.All.SendAsync("ReceiveMessage", JsonConvert.SerializeObject(recieveResult));
        }
    }
}
