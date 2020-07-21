'use strict';

function getDecimal(num) {
    var str = "" + num;
    var zeroPosition = str.indexOf(".");
    if(zeroPos == -1) {
        return 0;
    } 
    str = str.slice(zeroPosition);
    return +str;
}

alert ( getDecimal(12.5) ); //0.5
alert ( getDecimal(1.2) ); //0.2
alert ( getDecimal(-1.2) ); //0.2