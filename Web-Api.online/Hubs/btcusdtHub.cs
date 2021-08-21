using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Newtonsoft.Json;
using System.Linq;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories;
using Web_Api.online.Models.Enums;

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

        public async Task SendMessage(string amount, string price, bool isBuy)
        {
            decimal priceDecimal = Convert.ToDecimal(price);
            decimal amountDecimal = Convert.ToDecimal(amount);

            BTC_USDT_OpenOrders order = new BTC_USDT_OpenOrders
            {
                IsBuy = isBuy,
                Price = priceDecimal,
                Amount = amountDecimal,
                CreateUserId = "53cd122d-6253-4981-b290-11471f67c528",
                CreateDate = DateTime.Now,
            };

            await _tradeRepository.spAdd_BTC_USDT_Order(new Args_spAdd_BTC_USDT_OpenOrder() 
            { 
                IsBuy = isBuy,
                Amount = amountDecimal,
                Price = priceDecimal,
                UserId = "53cd122d-6253-4981-b290-11471f67c528"
            });

            var orders = (await _tradeRepository.Get_BTC_USDT_OpenOrdersAsync())
                .Where(x => x.IsBuy == !isBuy && x.Price == priceDecimal);

            bool isOrderClosed = false;

            if (orders.Count() > 0)
            {
                List<UpdatedOrderModel> updatedOrders = new List<UpdatedOrderModel>();

                foreach (var openOrder in orders)
                {
                    if (amountDecimal > openOrder.Amount)
                    {
                        amountDecimal -= openOrder.Amount;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        var localOrder = order;
                        localOrder.Amount = amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = localOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        order.Amount = amountDecimal;
                    }

                    if (amountDecimal < openOrder.Amount)
                    {
                        openOrder.Amount -= amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        order.Amount = amountDecimal;

                        isOrderClosed = true;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = order,
                            RemoveOpenOrderFromDataBase = true
                        });

                        break;
                    }

                    if (amountDecimal == openOrder.Amount)
                    {
                        order.Amount = amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = order,
                            RemoveOpenOrderFromDataBase = true
                        });

                        isOrderClosed = true;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        break;
                    }
                }

                foreach (var closedOrder in updatedOrders)
                {
                    if (closedOrder.RemoveOpenOrderFromDataBase == true)
                    {
                        await _tradeRepository
                            .spMove_BTC_USDT_FromOpenOrdersToClosedOrders(
                                closedOrder.Order,
                                order.CreateUserId,
                                ClosedOrderStatus.Completed);
                    }
                    else
                    {
                        await _tradeRepository.spUpdate_BTC_USDT_OpenOrder(closedOrder.Order);
                    }
                }
            }

            List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> openOrdersBuy = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(true);
            List<spGetOrderByDescPrice_BTC_USDT_OrderBookResult> openOrdersSell = await _tradeRepository.Get_BTC_USDT_OrderBookAsync(false);
            List<BTC_USDT_ClosedOrders> marketTrades = await _tradeRepository.spGet_BTC_USDT_ClosedOrders_Top100();

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
