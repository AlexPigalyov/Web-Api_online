"use strict";

var connection = new signalR.HubConnectionBuilder().withUrl("/statsordershub").build();

connection.on("ReceiveMessage", function (recieveModel) {
    //var msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    //var encodedMsg = user + " says " + msg;

    let model = JSON.parse(recieveModel);
    console.log(model);
    loadOrders(model);
});

connection.start();