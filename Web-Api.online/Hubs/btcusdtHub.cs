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

            long newId = await _tradeRepository.spAdd_BTC_USDT_Order(new Args_spAdd_BTC_USDT_OpenOrder()
            {
                IsBuy = isBuy,
                Amount = amountDecimal,
                Price = priceDecimal,
                UserId = "53cd122d-6253-4981-b290-11471f67c528"
            });

            order.OpenOrderId = newId;

            var orders = await _tradeRepository.Get_BTC_USDT_OpenOrdersAsync();

            var selectedOrders = orders.Where(x => x.IsBuy != isBuy && (isBuy ? priceDecimal >= x.Price : priceDecimal <= x.Price));

            var result = ProcessOrders(selectedOrders, order);

            if (result.UpdatedOrders != null)
            {
                foreach (var closedOrder in result.UpdatedOrders)
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
                CurrentOrder = result.IsCurrentOrderClosed ? null : order,
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades,
                IsBuy = isBuy
            };

            await Clients.All.SendAsync("ReceiveMessage", JsonConvert.SerializeObject(recieveResult));
        }

        private ProcessOrderResultModel ProcessOrders(IEnumerable<BTC_USDT_OpenOrders> selectedOrders, BTC_USDT_OpenOrders currentOrder)
        {
            if (selectedOrders.Any())
            {
                ProcessOrderResultModel processResult = new ProcessOrderResultModel();

                List<UpdatedOrderModel> updatedOrders = new List<UpdatedOrderModel>();

                decimal amountDecimal = currentOrder.Amount;
                bool isOrderClosed = false;

                foreach (var openOrder in selectedOrders)
                {
                    if (amountDecimal > openOrder.Amount)
                    {
                        amountDecimal -= openOrder.Amount;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        var localOrder = currentOrder;
                        localOrder.Amount = amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = localOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        currentOrder.Amount = amountDecimal;
                    }

                    if (amountDecimal < openOrder.Amount)
                    {
                        openOrder.Amount -= amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = openOrder,
                            RemoveOpenOrderFromDataBase = false
                        });

                        currentOrder.Amount = amountDecimal;

                        isOrderClosed = true;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = currentOrder,
                            RemoveOpenOrderFromDataBase = true
                        });

                        break;
                    }

                    if (amountDecimal == openOrder.Amount)
                    {
                        currentOrder.Amount = amountDecimal;

                        updatedOrders.Add(new UpdatedOrderModel
                        {
                            Order = currentOrder,
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

                processResult.UpdatedOrders = updatedOrders;
                processResult.IsCurrentOrderClosed = isOrderClosed;

                return processResult;
            }
            else
            {
                return new ProcessOrderResultModel()
                {
                    UpdatedOrders = null,
                    IsCurrentOrderClosed = false
                };
            }
        }
    }
}
