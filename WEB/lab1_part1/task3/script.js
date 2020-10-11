function getFromCharCode(in_element, out_element) {
    var node = document.getElementById(in_element);
    var result = []

    node.innerHTML.split(/[(\)]{1,2}/).forEach(function(item, index, array) {
        if(item !== ''){
            result.push(parseInt(item));
        }
    });
    document.getElementById(out_element).innerHTML = String.fromCharCode(...result);
}

function getCharCodeAt(in_element, out_element) {
    var node = document.getElementById(in_element);
    var result = []

    node.innerHTML.split(/[(\)]{1,2}/).forEach(function(item, index, array) {
        if(item !== ''){
            result.push(parseInt(item));
        }
    });
    var str = String.fromCharCode(...result);
    var msg = [];
    for (let index = 0; index < str.length; index++) {
        msg.push(str[index].charCodeAt());
    }
    document.getElementById(out_element).innerHTML = msg;
}

