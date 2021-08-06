"use strict";

var connection = new signalR.HubConnectionBuilder().withUrl("/btcusdthub").build();

//Disable send button until connection is established
document.getElementById("buyButton").disabled = true;

connection.on("ReceiveMessage", function (openOrders) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;
    let list = document.getElementsByClassName("orderbook-list")[0];

    var openOrdersObj = JSON.parse(openOrders);

    openOrdersObj.sort((a, b) => a.Price - b.Price);

    let filterLimit = 15;
    let forCount = 0;

    var openOrdersObjMaxAmount = Math.max.apply(null, openOrdersObj.slice(0, filterLimit).map(item => item.Amount));

    openOrdersObj.forEach(order => {
        let orderBookElem = document.createElement('div');
        orderBookElem.className = "orderbook-row";

        let orderBookElemColFirst = document.createElement('div');
        orderBookElemColFirst.className = "orderbook-col";
        orderBookElemColFirst.innerHTML = order.Price;

        orderBookElem.appendChild(orderBookElemColFirst);

        let orderBookElemColSecond = document.createElement('div');
        orderBookElemColSecond.className = "orderbook-col";
        orderBookElemColSecond.innerHTML = order.Amount;

        orderBookElem.appendChild(orderBookElemColSecond);

        let orderBookElemColThird = document.createElement('div');
        orderBookElemColThird.className = "orderbook-col";
        orderBookElemColThird.innerHTML = order.Price * order.Amount;

        orderBookElem.appendChild(orderBookElemColThird);

        let orderBookElemProgressBar = document.createElement('div');
        orderBookElemProgressBar.className = "orderbook-progress-bar";

        forCount += 1;

        if (forCount < filterLimit) {
            orderBookElemProgressBar.style = "transform: translateX(-" + ((order.Amount / openOrdersObjMaxAmount) * 100).toFixed() + "%);";
        }

        orderBookElem.appendChild(orderBookElemProgressBar);

        console.log(orderBookElem);

        list.appendChild(orderBookElem);
    });
});

connection.start().then(function () {
    document.getElementById("buyButton").disabled = false;
}).catch(function (err) {
    return console.error(err.toString());
});

document.getElementById("buyButton").addEventListener("click", function (event) {
    var amount = document.getElementById("amountInput").value.replace(".", ",");
    var price = document.getElementById("priceInput").value;
    connection.invoke("SendMessage", amount, price).catch(function (err) {
        return console.error(err.toString());
    });
    event.preventDefault();
});