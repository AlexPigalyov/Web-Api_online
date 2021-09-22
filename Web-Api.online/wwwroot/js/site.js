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
        return document.getElementsByClassName("orderbook-list")[1];
    }
    else {
        return document.getElementsByClassName("orderbook-list")[0];
    }
}

function loadOrderBook(openOrders, isLoad, isBuy = false) {

    let list = null;

    if (openOrders.length != 0) {
        if (!isBuy) {
            list = document.getElementsByClassName("orderbook-list")[0];

            list.innerHTML = '';
        }
        else {
            list = document.getElementsByClassName("orderbook-list")[1];

            list.innerHTML = '';
        }
    }
    else {
        return;
    }

    var openOrdersObjMaxAmount = null;
    if (isLoad) {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrders.map(item => item.amount));
    }
    else {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrders.map(item => item.Amount));
    }

    list.innerHTML = '';

    openOrders.forEach(order => {
        let time = null;
        let orderPrice = 0;
        let orderAmount = 0;
        let orderTotal = 0;
        let isBuyLocal = true;

        if (!isLoad) {
            orderPrice = order.Price;
            orderAmount = order.Amount;
            orderTotal = order.Total;
            isBuyLocal = order.IsBuy;
        }
        else {
            orderPrice = order.price;
            orderAmount = order.amount;
            orderTotal = order.total;
            isBuyLocal = order.isBuy;
        }

        let orderBookElem = document.createElement('div');
        orderBookElem.className = "orderbook-row";

        let orderBookElemColFirst = document.createElement('div');

        if (!isBuyLocal) {
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
        orderBookElemColThird.innerHTML = orderTotal;

        orderBookElem.appendChild(orderBookElemColThird);

        let orderBookElemProgressBar = document.createElement('div');
        if (!isBuyLocal) {
            orderBookElemProgressBar.className = "orderbook-progress-bar";
        }
        else {
            orderBookElemProgressBar.classList.add("orderbook-bids", "orderbook-progress-bar");
        }

        orderBookElemProgressBar.style = "transform: translateX(-" + ((orderAmount / openOrdersObjMaxAmount) * 100).toFixed() + "%);";

        orderBookElem.appendChild(orderBookElemProgressBar);

        list.appendChild(orderBookElem);
    });
}

function loadMarketTrades(openOrders, isLoad) {

    let list = document.getElementsByClassName("orderbook-list")[2];

    var openOrdersObjMaxAmount = null;

    if (openOrders.length == 0) {
        return;
    }

    list.innerHTML = '';

    openOrders.forEach(order => {
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
            orderPrice = order.ExposedPrice;
            time = new Date(order.ClosedDate);
        }
        else {
            orderPrice = order.price;
            orderAmount = order.amount;
            orderTotal = order.total;
            isBuy = order.isBuy;
            orderPrice = order.exposedPrice;
            time = new Date(order.closedDate);
        }

        let orderBookElem = document.createElement('div');

        if (!isBuy) {
            orderBookElem.classList.add("orderbook-asks", "orderbook-row");
        }
        else {
            orderBookElem.classList.add("orderbook-bids", "orderbook-row");
        }


        let orderBookElemColFirst = document.createElement('div');
        if (!isBuy) {
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

        let hour = time.getHours();
        let minutes = time.getMinutes();
        let seconds = time.getSeconds();

        orderBookElemColThird.innerHTML = hour + ':' + minutes + ':' + seconds;

        orderBookElem.appendChild(orderBookElemColThird);

        list.appendChild(orderBookElem);
    });
}

function makeRandomColor() {
    var c = '';
    while (c.length < 7) {
        c += (Math.random()).toString(16).substr(-6).substr(-1)
    }
    return '#' + c;
}

function loadUserOpenOrders(openOrders, isLoad) {

    let list = document.getElementsByClassName("orderbook-list")[3];

    const loadUserOpenOrder = (order) => {
        let time = null;
        let orderPrice = 0;
        let orderAmount = 0;
        let isBuy = true;
        let openOrderId = 0;

        if (!isLoad) {
            orderPrice = order.Price;
            orderAmount = order.Amount;
            isBuy = order.IsBuy;
            time = new Date(order.CreateDate);
            openOrderId = order.OpenOrderId;
        }
        else {
            orderPrice = order.price;
            orderAmount = order.amount;
            isBuy = order.isBuy;
            time = new Date(order.createDate);
            openOrderId = order.openOrderId;
        }

        let orderBookElem = document.createElement('div');

        if (!isBuy) {
            orderBookElem.classList.add("orderbook-asks", "orderbook-row");
        }
        else {
            orderBookElem.classList.add("orderbook-bids", "orderbook-row");
        }

        let orderBookElemColFirst = document.createElement('div');
        if (!isBuy) {
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

        let hour = time.getHours();
        let minutes = time.getMinutes();
        let seconds = time.getSeconds();

        orderBookElemColThird.innerHTML = hour + ':' + minutes + ':' + seconds;


        orderBookElem.appendChild(orderBookElemColThird);

        let orderBookElemButton = document.createElement('div');
        orderBookElemButton.className = "orderbook-col";

        let orderBookElemButtonA = document.createElement('a');
        orderBookElemButtonA.href = "/trade/cancelorder/" + openOrderId;
        orderBookElemButtonA.innerHTML = "Cancel";

        orderBookElemButton.appendChild(orderBookElemButtonA);
        orderBookElem.appendChild(orderBookElemButton);


        list.appendChild(orderBookElem);
    };

    if (isLoad) {
        if (openOrders.length == 0) {
            return;
        }

        list.innerHTML = '';

        openOrders.forEach(order => {
            loadUserOpenOrder(order);
        });
    }
    else {
        loadUserOpenOrder(openOrders);
    }

    

    
}

function loadNewOrderBook(openOrders, isLoad, isBuy = false, isMarketTrades = false, isUserOpenOrders = false) {

    var openOrders = openOrders;

    let list = null;

    if (openOrders.length == 0 && !isMarketTrades && !isUserOpenOrders) {
        if (!isBuy) {
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
        openOrdersObjMaxAmount = Math.max.apply(null, openOrders.map(item => item.amount));

        if (openOrders.length != 0) {
            list = getCurrentList(openOrders[0].isBuy, isMarketTrades, isUserOpenOrders);
        }
        else {
            return;
        }
    }
    else {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrders.map(item => item.Amount));

        if (openOrders.length != 0) {
            list = getCurrentList(openOrders[0].IsBuy, isMarketTrades, isUserOpenOrders);
        }
        else {
            return;
        }
    }

    list.innerHTML = '';

    openOrders.forEach(order => {
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
                orderPrice = order.ExposedPrice;
                time = new Date(order.ClosedDate);
            }
        }
        else {
            orderPrice = order.price;
            orderAmount = order.amount;
            orderTotal = order.total;
            isBuy = order.isBuy;
            if (isMarketTrades) {
                orderPrice = order.exposedPrice;
                time = new Date(order.closedDate);
            }
        }
        let orderBookElem = document.createElement('div');
        if (isMarketTrades || isUserOpenOrders) {
            if (!isBuy) {
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
        if (!isBuy) {
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
            if (!isBuy) {
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
