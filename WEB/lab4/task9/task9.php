<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p> Спросите <b>возраст</b> пользователя. Если форма была <b>отправлена</b> и <b>введен</b> возраст, то
        выведите его на экран, а форму уберите. Если же форма не была отправлена (это будет
        при <b>первом</b> заходе на страницу) - просто покажите ее</p><br />
        <?php
        if(!isset($_REQUEST['age'])) {
        ?>   
        <form action ="" method ="GET">
            <p>Ваш возраст: <input type="text" name="age"></p><br>
            <input type="submit">     
        </form>
        <?php
        }
        ?> 

        <?php
            if(isset($_REQUEST['age'])) { //isset определяет, была ли установлена переменная значением, отличным от NULL
               $age = strip_tags($_REQUEST['age']);
               echo 'Ваш возраст: '. $age;
           }      
        ?>
    </body>
</html>