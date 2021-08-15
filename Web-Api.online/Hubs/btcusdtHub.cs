using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Repositories;
using Newtonsoft.Json;
using System.Linq;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Hubs
{
    public class btcusdtHub : Hub
    {
        private readonly IOpenOrdersRepository _openOrdersRepository;
        private readonly IClosedOrdersRepository _closedOrdersRepository;

        public btcusdtHub(
            IOpenOrdersRepository openOrdersRepository,
            IClosedOrdersRepository closedOrdersRepository) : base()
        {
            _openOrdersRepository = openOrdersRepository;
            _closedOrdersRepository = closedOrdersRepository;
        }

        public async Task SendMessage(string amount, string price, bool isBuy)
        {
            decimal priceDouble = Convert.ToDecimal(price);
            decimal amountDouble = Convert.ToDecimal(amount);

            BTC_USDT_OpenOrders order = new BTC_USDT_OpenOrders
            {
                IsBuy = isBuy,
                Price = priceDouble,
                Amount = amountDouble,
                CreateUserId = "53cd122d-6253-4981-b290-11471f67c528",
                CreateDate = DateTime.Now
            };

            await _openOrdersRepository.CreateAsync(order);

            var orders = (await _openOrdersRepository.Get_BTC_USDT_OpenOrdersAsync())
                .Where(x => x.IsBuy == !isBuy && x.Price == priceDouble);

            bool isOrderClosed = false;

            if (orders.Count() > 0)
            {
                List<ClosedOrder> closedOrders = new List<ClosedOrder>();

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
                        localOrder.Amount = amountDouble;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = localOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        order.Amount = amountDouble;
                    }

                    if (amountDouble < openOrder.Amount)
                    {
                        openOrder.Amount -= amountDouble;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        order.Amount = amountDouble;

                        isOrderClosed = true;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = order,
                            RemoveOpenOrderFromDataBase = true
                        });

                        break;
                    }

                    if (amountDouble == openOrder.Amount)
                    {
                        order.Amount = amountDouble;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = order,
                            RemoveOpenOrderFromDataBase = true
                        });

                        isOrderClosed = true;

                        closedOrders.Add(new ClosedOrder
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        break;
                    }
                }

                foreach (var closedOrder in closedOrders)
                {
                    if (closedOrder.RemoveOpenOrderFromDataBase == true)
                    {
                        await _openOrdersRepository.RemoveByIdAsync(closedOrder.Order.OpenOrderId);

                        await _closedOrdersRepository.CreateAsync(new BTC_USDT_ClosedOrders()
                        {
                            ClosedOrderId = closedOrder.Order.OpenOrderId,
                            CreateDate = closedOrder.Order.CreateDate,
                            ClosedDate = DateTime.Now,
                            IsBuy = closedOrder.Order.IsBuy,
                            Price = closedOrder.Order.Price,
                            Amount = closedOrder.Order.Amount,
                            CreateUserId = closedOrder.Order.CreateUserId,
                            BoughtUserId = order.CreateUserId
                        });
                    }
                    else
                    {
                        await _openOrdersRepository.UpdateAsync(closedOrder.Order);
                    }
                }
            }

            List<OrderBookModel> openOrdersBuy = await _openOrdersRepository.Get_BTC_USDT_OrderBookAsync(true);
            List<OrderBookModel> openOrdersSell = await _openOrdersRepository.Get_BTC_USDT_OrderBookAsync(false);
            List<MarketTradesModel> marketTrades = await _closedOrdersRepository.Get_BTC_USDT_ClosedOrders();

            RecieveMessageResultModel recieveResult = new RecieveMessageResultModel()
            {
                CurrentOrder = isOrderClosed ? null : order,
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades,
                IsBuy = isBuy
            };

            await Clients.All.SendAsync("ReceiveMessage", JsonConvert.SerializeObject(recieveResult));
        }
    }
}
