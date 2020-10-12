function SomeFunction() {
    var user = detect.parse(navigator.userAgent).browser.family;
    if(user === 'IE') {
        window.open("https://www.tut.by/");
    } 
    else {
        window.open("https://www.google.by/");
    }
}