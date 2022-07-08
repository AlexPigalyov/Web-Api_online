using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;

namespace Web_Api.online.Jobs.Abstract;

public abstract class PairJobBase<T> where T : Hub
{
    private readonly IHubContext<T> _hubContext;
    private readonly TradeRepository _tradeRepository;
    private readonly string _sqlTableName;
    public PairJobBase(IHubContext<T> hubContext,TradeRepository tradeRepository,string sqlTableName)
    {
        _hubContext = hubContext;
        _tradeRepository = tradeRepository;
        _sqlTableName = sqlTableName;
    }
    
    public async Task Execute(IJobExecutionContext context)
    {
        var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync(_sqlTableName).Result;
        var openOrdersSell = _tradeRepository.GetSellOrderBookAsync(_sqlTableName).Result;
        var marketTrades = _tradeRepository.GetClosedOrders_Top100(_sqlTableName).Result;

        var recieveResult = new RecieveMessageResultModel()
        {
            OrderBookBuy = openOrdersBuy,
            OrderBookSell = openOrdersSell,
            MarketTrades = marketTrades
        };

        _hubContext.Clients.All.SendAsync($"ReceiveMessage", JsonConvert.SerializeObject(recieveResult)).Wait();
    }
}