// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
function loadNewOrderBook(openOrders, isLoad) {
    let list = document.getElementsByClassName("orderbook-list")[0];

    list.innerHTML = '';
    var openOrdersObj = openOrders;

    if (!isLoad) {
        openOrdersObj = JSON.parse(openOrders);
    }


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
        orderBookElemColFirst.className = "orderbook-col";
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
        orderBookElemProgressBar.className = "orderbook-progress-bar";

        orderBookElemProgressBar.style = "transform: translateX(-" + ((orderAmount / openOrdersObjMaxAmount) * 100).toFixed() + "%);";

        orderBookElem.appendChild(orderBookElemProgressBar);

        console.log(orderBookElem);

        list.appendChild(orderBookElem);
    });
}
// Write your JavaScript code.
