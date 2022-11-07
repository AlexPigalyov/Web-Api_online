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

function updateURLParameter(url, param, paramVal) {
    var newAdditionalURL = "";
    var tempArray = url.split("?");
    var baseURL = tempArray[0];
    var additionalURL = tempArray[1];
    var temp = "";
    if (additionalURL) {
        tempArray = additionalURL.split("&");
        for (var i = 0; i < tempArray.length; i++) {
            if (tempArray[i].split('=')[0] != param) {
                newAdditionalURL += temp + tempArray[i];
                temp = "&";
            }
        }
    }

    var rows_txt = temp + "" + param + "=" + paramVal;
    return baseURL + "?" + newAdditionalURL + rows_txt;
}

function getQueryParams(qs) {
    qs = qs.split('+').join(' ');

    var params = {},
        tokens,
        re = /[?&]?([^=]+)=([^&]*)/g;

    while (tokens = re.exec(qs)) {
        params[decodeURIComponent(tokens[1])] = decodeURIComponent(tokens[2]);
    }

    return params;
}

function getUrlParametr(name, url) {
    if (!url) url = location.href;
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(url);
    return results == null ? null : results[1];
}
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