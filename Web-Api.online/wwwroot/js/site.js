// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
function loadNewOrderBook(openOrders, isLoad, isBuy) {

    let list = isBuy ? document.getElementsByClassName("orderbook-list")[0] : document.getElementsByClassName("orderbook-list")[1];

    list.innerHTML = '';

    var openOrdersObj = openOrders;

    var openOrdersObjMaxAmount = null;
    if (isLoad) {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrdersObj.map(item => item.amount));
    }
    else {
        openOrdersObjMaxAmount = Math.max.apply(null, openOrdersObj.map(item => item.Amount));
    }

    openOrdersObj.forEach(order => {
        let orderPrice = 0;
        let orderAmount = 0;
        if (!isLoad) {
            orderPrice = order.Price;
            orderAmount = order.Amount;
        }
        else {
            orderPrice = order.price;
            orderAmount = order.amount;
        }
        let orderBookElem = document.createElement('div');
        orderBookElem.className = "orderbook-row";

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
        orderBookElemColThird.innerHTML = orderPrice * orderAmount;

        orderBookElem.appendChild(orderBookElemColThird);

        let orderBookElemProgressBar = document.createElement('div');
        if (isBuy) {
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
// Write your JavaScript code.
