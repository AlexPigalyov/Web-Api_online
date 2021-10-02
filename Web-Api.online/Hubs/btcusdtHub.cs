using Microsoft.AspNetCore.SignalR;

using Web_Api.online.Data.Repositories;

namespace Web_Api.online.Hubs
{
    public class btcusdtHub : Hub
    {
        private readonly TradeRepository _tradeRepository;

        public btcusdtHub(
            TradeRepository tradeRepository) : base()
        {
            _tradeRepository = tradeRepository;
        }
    }
}
