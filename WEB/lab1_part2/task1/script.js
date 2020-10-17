function getAllBoldWords(element) {
    let matchAll = document.getElementById(element).innerHTML.match(/(?<=<b>)(.*?)(?=<\/b>)/g);
    document.getElementById("res").innerHTML = matchAll;
}