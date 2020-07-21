'use strict';
var age = prompt("Ваш возраст", "18");
switch(age) {
    case "1":
        alert("Никогда не срабатывает");
    case "18":
        alert("Вам 18 лет");
        break;
    default:
        alert("Любое значение, не совпавшее в case");        
}