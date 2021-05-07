"use strict";

var connection = new signalR.HubConnectionBuilder().withUrl("/hubs/btc_usdt").build();

//Disable send button until connection is established
document.getElementById("buyButton").disabled = true;

connection.on("ReceiveMessage", function (openOrders) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;
    var li = document.createElement("li");
    li.textContent = openOrders;
    document.getElementById("messagesList").appendChild(li);
});

connection.start().then(function () {
    document.getElementById("buyButton").disabled = false;
}).catch(function (err) {
    return console.error(err.toString());
});

document.getElementById("buyButton").addEventListener("click", function (event) {
    var amount = document.getElementById("amountInput").value;
    var price = document.getElementById("priceInput").value;
    connection.invoke("SendMessage", amount, price).catch(function (err) {
        return console.error(err.toString());
    });
    event.preventDefault();
});