<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p>  Спросите у пользователя <b></b>знает ли он PHP</b> с помощью двух radio-кнопок. Выведите
        результат на экран. Сделайте так, чтобы по умолчанию один из вариантов был уже
        отмечен.</p>
        <form action="" method="GET">
            <p>Знаете ли вы PHP?</p>
            <p>да<input type="radio" name="btn" value="yes" checked></p>
            <p>нет<input type="radio" name="btn" value="no"></p>
            <input type="submit" value="Подача запроса">
        </form>
        
        <?php
        if(isset($_REQUEST['btn']) and $_REQUEST['btn'] == 'yes') {
            echo "Вы знаете PHP!";
        }
        if(isset($_REQUEST['btn']) and $_REQUEST['btn'] == 'no') {
            echo "Вы не знаете PHP";
        }
        ?>
    </body>
</html>