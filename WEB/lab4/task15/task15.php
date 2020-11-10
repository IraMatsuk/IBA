<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p>Спросите у пользователя его возраст с помощью <b>select</b>. Варианты ответа сделайте
        такими: <b>менее 20 лет, 20-25, 26-30, более 30</b></p>
        <form action="" method="GET">
            <select name="age">
                <option disabled>Сколько вам лет?</option>
                <option value="1">менее 20 лет</option>
                <option value="2">20-25</option>
                <option value="3">26-30</option>
                <option value="4">более 30 лет</option>          
            </select>
            <input type="submit" value="Подача запроса">
        </form>
        <?php
        //solution1
        /*if(isset($_REQUEST['age']) and $_REQUEST['age'] == '1') {
            echo "Вам менее 20 лет";
        }
        if(isset($_REQUEST['age']) and $_REQUEST['age'] == '2') {
            echo "Вам 20-25 лет";
        }
        if(isset($_REQUEST['age']) and $_REQUEST['age'] == '3') {
            echo "Вам 26-30 лет";
        }
        if(isset($_REQUEST['age']) and $_REQUEST['age'] == '4') {
            echo "Вам более 30 лет";
        }*/
        

        //solution2
        if(isset($_REQUEST['age'])) {
            if($_REQUEST['age'] == 1) {
                echo "Вам менее 20 лет";
            }
        if($_REQUEST['age'] == '2') {
            echo "Вам 20-25 лет";
        }
        if($_REQUEST['age'] == '3') {
            echo "Вам 26-30 лет";
        }
        if($_REQUEST['age'] == '4') {
            echo "Вам более 30 лет";
        }
        }
        ?>
    </body>
</html>