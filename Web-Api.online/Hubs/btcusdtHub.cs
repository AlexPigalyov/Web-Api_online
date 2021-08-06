using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Repositories;
using Newtonsoft.Json;

namespace Web_Api.online.Hubs
{
    public class btcusdtHub : Hub
    {
        private TradeRepository _tradeRepository;

        public btcusdtHub(TradeRepository tradeRepository) : base()
        {
            _tradeRepository = tradeRepository;
        }

        public async Task SendMessage(string amount, string price)
        {
            double priceDouble = Convert.ToDouble(price);
            double amountDouble = Convert.ToDouble(amount);

            OpenOrder order = new OpenOrder
            {
                IsBuy = true,
                Price = priceDouble,
                Amount = amountDouble,
                CreateUserId = "53cd122d-6253-4981-b290-11471f67c528"
            };

            await _tradeRepository.Add_BTC_USDT_OrderAsync(order);

            List<OrderBookModel> openOrders = await _tradeRepository.Get_BTC_USDT_OrderBookAsync();

            await Clients.All.SendAsync("ReceiveMessage", JsonConvert.SerializeObject(openOrders));
        }
    }
}
