var userName = prompt("Введите логин:", "");
if (userName == "Админ") {
    var password = prompt("Введите пароль:", "");
        if(password == "Черный Властелин") {
            alert("Добро пожаловать!");
        } else if (password == null) {
            alert("Вход отменён");
        } 
        else {
            alert("Пароль неверен");
        }
}
else if (userName == null) {
    alert("Вход отменён");
}
else {
    alert("Я вас не знаю");
}
