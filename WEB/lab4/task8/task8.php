<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p>Спросите у пользователя <b>имя, возраст</b>, а также попросите его ввести <b>сообщение</b> (его сделайте в <b>textarea</b>).Выведите эти данные на экран в <b>формате</b>, приведенном под
            данной задачей. Позаботьтесь о том, чтобы пользователь <b>не мог вводить теги</b> (просто удаляйте их) и таким образом сломать сайт. </p><br />
        <form action ="" method ="GET">
            <p>Введите имя: <input type="text" name="name"></p><br>
            <p>Ваш возраст: <input type="text" name="age"></p><br>
            <p>Введите сообщение: <textarea name="message"></textarea></p><br>
            <input type="submit">     
        </form>
        
    <?php
       if(!empty($_REQUEST['name'])) {
           $name =  strip_tags($_REQUEST['name']);
           $age = strip_tags($_REQUEST['age']);
           $message = strip_tags($_REQUEST['message']);
           echo 'Привет, '.$name . ', ' . $age . ' лет. <br />Ваше сообщение: ' . $message;
       }      
    ?>
    </body>
</html>