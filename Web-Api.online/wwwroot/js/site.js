// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
function getCurrentList(isBuy, isMarketTrades) {
    if (isMarketTrades) {
        return document.getElementsByClassName("orderbook-list")[2];
    }

    if (isBuy) {
        return document.getElementsByClassName("orderbook-list")[0];
    }
    else {
        return document.getElementsByClassName("orderbook-list")[1];
    }
}

function loadNewOrderBook(openOrders, isLoad, isMarketTrades = false) {
    var openOrdersObj = openOrders;

    let list = null;

    var openOrdersObjMaxAmount = null;
    if (isLoad) {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrdersObj.map(item => item.amount));

        list = getCurrentList(openOrdersObj[0].isBuy, isMarketTrades);
    }
    else {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrdersObj.map(item => item.Amount));

        list = getCurrentList(openOrdersObj[0].IsBuy, isMarketTrades);
    }

    list.innerHTML = '';

    openOrdersObj.forEach(order => {
        let time = null;
        let orderPrice = 0;
        let orderAmount = 0;
        let isBuy = true;

        if (!isLoad) {
            orderPrice = order.Price;
            orderAmount = order.Amount;
            isBuy = order.IsBuy;
            if (isMarketTrades) {
                time = new Date(order.ClosedDate);
            }
        }
        else {
            orderPrice = order.price;
            orderAmount = order.amount;
            isBuy = order.isBuy;
            if (isMarketTrades) {
                time = new Date(order.closedDate);
            }
        }
        let orderBookElem = document.createElement('div');
        if (isMarketTrades) {
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
        if (isMarketTrades) {
            let hour = time.getHours();
            let minutes = time.getMinutes();
            let seconds = time.getSeconds();

            orderBookElemColThird.innerHTML = hour + ':' + minutes + ':' + seconds;
        }
        else {
            orderBookElemColThird.innerHTML = orderPrice * orderAmount;
        }

        orderBookElem.appendChild(orderBookElemColThird);

        if (!isMarketTrades) {
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
