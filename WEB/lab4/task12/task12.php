<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p>  Спросите у пользователя, какие из языков он знает: <b>html, css, php, javascript</b>.
        Выведите на экран те языки, которые знает пользователь.</p>
        <form action="" method="GET">
            <p>html<input type="checkbox" name="language[]" value="html"></p>
            <p>css<input type="checkbox" name="language[]" value="css"></p>
            <p>php<input type="checkbox" name="language[]" value="php"></p>
            <p>javascript<input type="checkbox" name="language[]" value="javascript"></p>
            <input type="submit" value="Подача запроса">
        </form>
        
        <?php
        /*if(isset($_REQUEST['language'])){
            $language = $_REQUEST['language'];           
            echo "Вы знаете: ";
            foreach ($language as $item){
                echo "$item "; 
            }
        }*/
        
        if(isset($_REQUEST['language'])){
        echo 'Вы знаете: ' . implode(', ',$_REQUEST['language']); //implode — объединяет элементы массива в строку
        }
        ?>
    </body>
</html>