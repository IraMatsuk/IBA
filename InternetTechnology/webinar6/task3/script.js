//var userName = prompt("Введите логин:", "");
// if (userName == "Админ") {
//     var password = prompt("Введите пароль:", "");
//         if(password == "Черный Властелин") {
//             alert("Добро пожаловать!");
//         } else if (password == null) {
//             alert("Вход отменён");
//         } 
//         else {
//             alert("Пароль неверен");
//         }
// }
// else if (userName == null) {
//     alert("Вход отменён");
// }
// else {
//     alert("Я вас не знаю");
// }

// var password = prompt("Введите пароль:", "");
// if(userName == "Админ" && password == "Черный Властелин") {
//     alert("Добро пожаловать!");
// } else if (userName == "Админ" && password != "Черный Властелин" || userName != "Админ" && password == "Черный Властелин") {
//     alert("Неверный логин/пароль!")
// } else if (userName != "Админ" &&  password != "Черный Властелин") {
//     alert("Такой учетной записи не существует!");
// }

function checkNameAndPasswor() {
    var user_name = prompt("Введите логин:");
    var passw = prompt("Введите пароль:");
    if (user_name == name && passw == pass) {
        alert("Добро пожаловать!");
    } else if (user_name == name && passw != pass || user_name != name && passw == pass) {
        alert("Неверный логин/пароль!");
    } else {
        alert("Такой учетной записи не существует!");
    }
}
