<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p>Спросите у пользователя его возраст с помощью нескольких radio-кнопок. Варианты
            ответа сделайте такими: <b>менее 20 лет, 20-25, 26-30, более 30.</b></p>
        <form action="" method="GET">
            <p>Сколько вам лет?</p>
            <p>менее 20 лет<input type="radio" name="btn" value="1"></p>
            <p>20-25<input type="radio" name="btn" value="2"></p>
            <p>26-30<input type="radio" name="btn" value="3"></p>
            <p>более 30<input type="radio" name="btn" value="4"></p>
            <input type="submit" value="Подача запроса">
        </form>
        
        <?php
        if(isset($_REQUEST['btn']) and $_REQUEST['btn'] == '1') {
            echo "Вам менее 20 лет";
        }
        if(isset($_REQUEST['btn']) and $_REQUEST['btn'] == '2') {
            echo "Вам 20-25 лет";
        }
        if(isset($_REQUEST['btn']) and $_REQUEST['btn'] == '3') {
            echo "Вам 26-30 лет";
        }
        if(isset($_REQUEST['btn']) and $_REQUEST['btn'] == '4') {
            echo "Вам более 30 лет";
        }
        ?>
    </body>
</html>