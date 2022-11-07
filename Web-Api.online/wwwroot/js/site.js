$(document).ready(function () {
    removeZeroes();
});

function removeZeroes() {
    $('.decimal-data').each(function () {
        var ttt = $(this).text();
        ttt = ttt.replace(",", ".");
        var ggg = ttt.toString();

        for (var i = 1; ggg.length > 0; i++) {
            var lastChar = ggg.substr(ggg.length - 1);
            var last2xChar = ggg.substr(ggg.length - 3, ggg.length - 2);
            if (last2xChar.charAt(0) == '.' || last2xChar.charAt(0) == ',') break;
            if (lastChar == '0') {
                ggg = ggg.slice(0, -1);
            }
            else break;
        }

        $(this).text(ggg);

        var ddd = 10;
    });
}

function copyTextToClipboard(text, msg) {

    navigator.clipboard.writeText(text);

    tempAlert(msg, 1000);
}


function tempAlert(msg, duration) {
    var el = document.createElement("div");

    el.setAttribute("class", "b-popup-content");

    el.innerHTML = msg;

    setTimeout(function () {
        el.parentNode.removeChild(el);
    },
        duration);

    document.body.appendChild(el);
}

function showModalQr() {

    var modal = this.closest('div');

    modal.style.display = "block";  

    tempAlert("Clicked", 1000);
}

function closeModalQr() {

    var modal = this.closest('div');

    modal.style.display = "none";
}