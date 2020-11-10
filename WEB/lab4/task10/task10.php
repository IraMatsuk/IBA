<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p> Спросите у пользователя логин и пароль (в браузере должен быть звездочками).
        Сравните их с логином $login и паролем $pass, хранящихся в файле. Если все верно -
        выведите 'Доступ разрешен!', в противном случае - 'Доступ запрещен!'. Сделайте так,
        чтобы скрипт обрезал концевые пробелы в строках, которые ввел пользователь</p>
        <form action="" method="get">
            <input type="text" value="" name="login" />
            <input type="password" value="" name="password" />
            <input type="submit" value="вход" />
        </form>         
        <?php
        $userLogin = 'MatsukIra';
        $userPassword = '1234qwer';

        if(!empty($_REQUEST['login']) && !empty($_REQUEST['password'])) {
        $login = trim($_REQUEST['login']);
        $password = trim($_REQUEST['password']);

            if($login == $userLogin && $password == $userPassword) {
                echo 'Доступ разрешен!';
            }
            else {
                echo 'Доступ запрещен!';
            }
        }
        ?>
    </body>
</html>