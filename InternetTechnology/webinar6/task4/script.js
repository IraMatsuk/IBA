function checkPassword() {
    var password = prompt("Введите пароль:");
    if (password == rightPassword) {
        document.write("Здравствуйте, <b>авторизированный</b> пользователь!");
    } else {
        document.write("Вы ввели неверный пароль.");
    }     
}