function checkPassword() {
    var password = prompt('Введите пароль:');
    if (password == pass) {
        alert(`Здравствуйте авторизованный пользователь!`);
    } else {
        alert('Вы ввели неправильный пароль');
    }
}


