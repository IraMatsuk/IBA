<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $number = 442158755745;
            $searchNumber = 5;
            $count = substr_count( $number, $searchNumber );
            echo 'В числе ' . $number . ' число ' . $searchNumber . ' встречается ' . $count . ' раз(а)';        
        ?>
    </body>
</html>