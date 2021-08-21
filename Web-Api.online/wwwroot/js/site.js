// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
function getCurrentList(isBuy, isMarketTrades, isUserOpenOrders) {
    if (isMarketTrades) {
        return document.getElementsByClassName("orderbook-list")[2];
    }

    if (isUserOpenOrders) {
        return document.getElementsByClassName("orderbook-list")[3];
    }

    if (isBuy) {
        return document.getElementsByClassName("orderbook-list")[0];
    }
    else {
        return document.getElementsByClassName("orderbook-list")[1];
    }
}

function loadNewOrderBook(openOrders, isLoad, isBuy = false, isMarketTrades = false, isUserOpenOrders = false) {

    var openOrdersObj = openOrders;

    let list = null;

    if (openOrdersObj.length == 0 && !isMarketTrades && !isUserOpenOrders) {
        if (isBuy) {
            list = document.getElementsByClassName("orderbook-list")[0];

            list.innerHTML = '';
            }
        else {
            list = document.getElementsByClassName("orderbook-list")[1];

            list.innerHTML = '';
        }
    }

    var openOrdersObjMaxAmount = null;
    if (isLoad) {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrdersObj.map(item => item.amount));

        if (openOrdersObj.length != 0) {
            list = getCurrentList(openOrdersObj[0].isBuy, isMarketTrades, isUserOpenOrders);
        }
        else {
            return;
        }
    }
    else {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrdersObj.map(item => item.Amount));

        if (openOrdersObj.length != 0) {
            list = getCurrentList(openOrdersObj[0].IsBuy, isMarketTrades, isUserOpenOrders);
        }
        else {
            return;
        }
    }

    list.innerHTML = '';

    openOrdersObj.forEach(order => {
        let time = null;
        let orderPrice = 0;
        let orderAmount = 0;
        let orderTotal = 0;
        let isBuy = true;

        if (!isLoad) {
            orderPrice = order.Price;
            orderAmount = order.Amount;
            orderTotal = order.Total;
            isBuy = order.IsBuy;
            if (isMarketTrades) {
                time = new Date(order.ClosedDate);
            }
        }
        else {
            orderPrice = order.price;
            orderAmount = order.amount;
            orderTotal = order.total;
            isBuy = order.isBuy;
            if (isMarketTrades) {
                time = new Date(order.closedDate);
            }
        }
        let orderBookElem = document.createElement('div');
        if (isMarketTrades || isUserOpenOrders) {
            if (isBuy) {
                orderBookElem.classList.add("orderbook-asks", "orderbook-row");
            }
            else {
                orderBookElem.classList.add("orderbook-bids", "orderbook-row");
            }
        }
        else {
            orderBookElem.className = "orderbook-row";
        }

        let orderBookElemColFirst = document.createElement('div');
        if (isBuy) {
            orderBookElemColFirst.className = "orderbook-col";
        }
        else {
            orderBookElemColFirst.classList.add("orderbook-col", ".orderbook-bids");
        }

        orderBookElemColFirst.innerHTML = orderPrice;

        orderBookElem.appendChild(orderBookElemColFirst);

        let orderBookElemColSecond = document.createElement('div');
        orderBookElemColSecond.className = "orderbook-col";
        orderBookElemColSecond.innerHTML = orderAmount;

        orderBookElem.appendChild(orderBookElemColSecond);

        let orderBookElemColThird = document.createElement('div');
        orderBookElemColThird.className = "orderbook-col";
        if (isMarketTrades || isUserOpenOrders) {
            let hour = time.getHours();
            let minutes = time.getMinutes();
            let seconds = time.getSeconds();

            orderBookElemColThird.innerHTML = hour + ':' + minutes + ':' + seconds;
        }
        else {
            orderBookElemColThird.innerHTML = orderTotal;
        }

        orderBookElem.appendChild(orderBookElemColThird);

        if (isUserOpenOrders) {
            let orderBookElemButton = document.createElement('div');
            orderBookElemButton.className = "orderbook-col";

            let orderBookElemButtonA = document.createElement('a');
            orderBookElemButtonA.href = "/trade/cancelorder/" + (isLoad ? order.createUserId : order.CreateUserId);
            orderBookElemButtonA.innerHTML = "Cancel";
        }

        if (!isMarketTrades && !isUserOpenOrders) {
            let orderBookElemProgressBar = document.createElement('div');
            if (isBuy) {
                orderBookElemProgressBar.className = "orderbook-progress-bar";
            }
            else {
                orderBookElemProgressBar.classList.add("orderbook-bids", "orderbook-progress-bar");
            }

            orderBookElemProgressBar.style = "transform: translateX(-" + ((orderAmount / openOrdersObjMaxAmount) * 100).toFixed() + "%);";

            orderBookElem.appendChild(orderBookElemProgressBar);
        }

        list.appendChild(orderBookElem);
    });
}
// Write your JavaScript code.
