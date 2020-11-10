<html>
    <head>
        <meta charset="UTF-8">
    </head>
    <body>
        <p> Спросите у пользователя имя с помощью формы. <b>Сделайте чекбокс</b>: если он
        отмечен, то поприветствуйте пользователя, если не отмечен - попрощайтесь с
        пользователем</p>
        <form action="" method="GET">
            <input type="text" name="userName">
            <input type="checkbox" name="hello" value="1">
            <input type="submit" value="Подача запроса">
        </form>
        
        <?php
       if(!empty($_REQUEST['userName'])) {
           $name = $_REQUEST['userName'];          
            if(isset($_REQUEST['hello']) and $_REQUEST['hello'] == 1) {
                echo 'Привет, ' . $name . '<br />';
            } else {
                echo 'Прощай, ' . $name;
            }
        } 
        ?>      
    </body>
</html>