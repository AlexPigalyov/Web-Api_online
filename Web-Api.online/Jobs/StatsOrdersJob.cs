using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Quartz;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Jobs;

[DisallowConcurrentExecution]
public class StatsOrdersJob : IJob
{
    private readonly TradeRepository _tradeRepository;
    private readonly IHubContext<StatsOrdersHub> _hubContext;

    public StatsOrdersJob(TradeRepository tradeRepository, IHubContext<StatsOrdersHub> hubContext)
    {
        _tradeRepository = tradeRepository;
        _hubContext = hubContext;
    }

    public async Task Execute(IJobExecutionContext context)
    {
        var closedOrders = await _tradeRepository.GetClosedOrdersPaged(1, 100);

        _hubContext.Clients.All.SendAsync($"ReceiveMessage", JsonConvert.SerializeObject(closedOrders)).Wait();
    }
}