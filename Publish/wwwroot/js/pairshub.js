"use strict";

var splittedUrl = document.URL.split('/');
var cryptExchangePair = splittedUrl[splittedUrl.length - 1].toUpperCase()

var cryptExchangePairHub = "/" + cryptExchangePair + "hub";

var connection = new signalR.HubConnectionBuilder().withUrl(cryptExchangePairHub).build();

connection.on("ReceiveMessage", function (recieveModel) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;

    let model = JSON.parse(recieveModel);

    var currentMarketTradeDoc = document.getElementsByClassName("orderbook-ticker-status")[0];

    $("#current-price").text(model.MarketTrades[0].StartPrice);

    var orderValue = model.MarketTrades[0].StartPrice * model.MarketTrades[0].Amount;
    $("#orderbook-ticker-markprice").text(parseFloat(orderValue.toFixed(4)));

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
    if (document.getElementById("buyButton") != null) {
        document.getElementById("buyButton").disabled = false;
    }
}).catch(function (err) {
    return console.error(err.toString());
});

