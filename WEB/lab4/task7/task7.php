<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p>Спросите имя пользователя с помощью формы. Результат запишите в переменую $name. Выведите на экран фразу 'Привет, Имя'.</p><br />
    <form action ="" method ="GET">
        <input type="text" name="userName">
        <input type="submit">     
    </form>
    <?php
       if(!empty($_REQUEST['userName'])) {
           $name = $_REQUEST['userName'];
           echo 'Привет, '.$name;
       }      
    ?>
    </body>
</html>