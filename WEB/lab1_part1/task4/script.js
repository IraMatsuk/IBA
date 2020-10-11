function getIndexesOfBoldWords(element) {
    var node = document.getElementById(element);
    var indexes=[], index=-1;
    while((index = node.innerHTML.indexOf("<b>", index + 1)) >= 0) indexes.push(" " + index);
    document.getElementById("res").innerHTML = indexes;
}



