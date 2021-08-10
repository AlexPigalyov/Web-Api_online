using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Repositories;
using Newtonsoft.Json;
using System.Linq;

namespace Web_Api.online.Hubs
{
    public class btcusdtHub : Hub
    {
        private TradeRepository _tradeRepository;

        public btcusdtHub(TradeRepository tradeRepository) : base()
        {
            _tradeRepository = tradeRepository;
        }

        public async Task SendMessage(string amount, string price, bool isBuy)
        {
            decimal priceDouble = Convert.ToDecimal(price);
            decimal amountDouble = Convert.ToDecimal(amount);

            spGet_BTC_USDT_OpenOrdersResult order = new spGet_BTC_USDT_OpenOrdersResult
            {
                IsBuy = isBuy,
                Price = priceDouble,
                Amount = amountDouble,
                CreateUserId = "53cd122d-6253-4981-b290-11471f67c528",
                CreateDate = DateTime.Now
            };

            await _tradeRepository.Add_BTC_USDT_OrderAsync(order);

            var orders = (await _tradeRepository.Get_BTC_USDT_OpenOrdersAsync())
                .Where(x => x.IsBuy == !isBuy && x.Price == priceDouble);

            List<ClosedOrder> closedOrders = new List<ClosedOrder>();

            if (orders != null)
            {
                foreach (var openOrder in orders)
                {
                    if (amountDouble > openOrder.Amount)
                    {
                        amountDouble -= openOrder.Amount;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        var localOrder = order;
                        localOrder.Amount = openOrder.Amount;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = localOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        order.Amount = amountDouble;
                    }

                    if (amountDouble < openOrder.Amount)
                    {
                        openOrder.Amount = amountDouble;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        order.Amount = amountDouble;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = order,
                            RemoveOpenOrderFromDataBase = true
                        });
                    }

                    if (amountDouble == openOrder.Amount)
                    {
                        order.Amount = amountDouble;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = order,
                            RemoveOpenOrderFromDataBase = true
                        });

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });
                    }
                }

                foreach (var closedOrder in closedOrders)
                {
                    if (closedOrder.RemoveOpenOrderFromDataBase == true)
                    {
                        await _tradeRepository.RemoveOpenOrderById(closedOrder.Order.OpenOrderId);
                    }

                    await _tradeRepository.Add_BTC_USDT_ClosedOrderAsync(new spGet_BTC_USDT_ClosedOrdersResult()
                    {
                        CreateDate = closedOrder.Order.CreateDate,
                        ClosedDate = DateTime.Now,
                        IsBuy = closedOrder.Order.IsBuy,
                        Price = closedOrder.Order.Price,
                        Amount = closedOrder.Order.Amount,
                        CreateUserId = closedOrder.Order.CreateUserId,
                        BoughtUserId = order.CreateUserId
                    });
                }
            }

            List<OrderBookModel> openOrders = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(isBuy);

            RecieveMessageResultModel recieveResult = new RecieveMessageResultModel()
            {
                OrderBook = openOrders,
                IsBuy = isBuy
            };

            await Clients.All.SendAsync("ReceiveMessage", JsonConvert.SerializeObject(recieveResult));
        }
    }
}
