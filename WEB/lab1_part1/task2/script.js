function getSubstr(in_element, out_element) {
    var node = document.getElementById(in_element);  
    var beginIndexOfBoldStr = node.innerHTML.indexOf("<b>") + 3;
    var endIndexOfBoldStr = node.innerHTML.indexOf("</b>")
    var substring = node.innerHTML.substr(beginIndexOfBoldStr, endIndexOfBoldStr - beginIndexOfBoldStr);
    document.getElementById(out_element).innerHTML = substring;
}

function getSubstring(in_element, out_element1) {
    var node = document.getElementById(in_element);  
    var beginIndexOfBoldStr = node.innerHTML.indexOf("<b>") + 3;
    var endIndexOfBoldStr = node.innerHTML.indexOf("</b>")
    var substring = node.innerHTML.substring(beginIndexOfBoldStr, endIndexOfBoldStr);
    document.getElementById(out_element1).innerHTML = substring;
}
