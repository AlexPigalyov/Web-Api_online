"use strict";

var connection = new signalR.HubConnectionBuilder().withUrl("/btcusdthub").build();

//Disable send button until connection is established
document.getElementById("buyButton").disabled = true;

connection.on("ReceiveMessage", function (openOrders) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;
    loadNewOrderBook(openOrders);
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