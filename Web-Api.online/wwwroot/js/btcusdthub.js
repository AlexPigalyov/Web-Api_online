"use strict";

var connection = new signalR.HubConnectionBuilder().withUrl("/btcusdthub").build();

connection.on("ReceiveMessage", function (recieveModel) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;

    let model = JSON.parse(recieveModel);

    var currentMarketTradeDoc = document.getElementsByClassName("orderbook-ticker-status")[0];
    currentMarketTradeDoc.children[0].innerHTML = model.MarketTrades[0].ExposedPrice;

    currentMarketTradeDoc.classList.remove('status-buy');
    currentMarketTradeDoc.classList.remove('status-sell');
    currentMarketTradeDoc.classList.add((model.MarketTrades[0].IsBuy ? 'status-buy' : 'status-sell'));

    currentMarketTradeDoc.children[1].style.transform = (model.MarketTrades[0].IsBuy ? 'rotate(180deg)' : 'rotate(360deg)');

    loadOrderBook(model.OrderBookSell, false, false);
    loadOrderBook(model.OrderBookBuy, false, true);
    loadMarketTrades(model.MarketTrades, false);
});

connection.on("OrderWasClosed", function (recieveModel) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;

    removeUserOpenOrder(receiveModel);
});

connection.on("OrderWasCreated", function (recieveModel) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;

    createUserOpenOrder(receiveModel);
});


connection.start().then(function () {
    document.getElementById("buyButton").disabled = false;
}).catch(function (err) {
    return console.error(err.toString());
});

document.getElementById("buyButton").addEventListener("click", function (event) {
    var amount = document.getElementById("amountInput").value;
    var price = document.getElementById("priceInput").value;

    $.ajax({
        url: '/trade/createorder',
        type: 'POST',
        data: JSON.stringify({
            Price: price,
            Amount: amount,
            IsBuy: true
        }),
        contentType: 'application/json; charset=utf-8'
    });
});

document.getElementById("sellButton").addEventListener("click", function (event) {
    var amount = document.getElementById("amountInput").value;
    var price = document.getElementById("priceInput").value;

    $.ajax({
        url: '/trade/createorder',
        type: 'POST',
        data: JSON.stringify({
            Price: price,
            Amount: amount,
            IsBuy: false
        }),
        contentType: 'application/json; charset=utf-8'
    });
});