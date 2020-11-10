<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <p>Создать массив, наполнить его случайными значениями (можно использовать
        функцию rand), найти максимальное и минимальное значение массива и поменять их местами.</p>
        <?php
        $arr = [];
        for($i = 0; $i < 10; $i++) {
            $arr[] = rand(1, 200);
        }
        echo '<p>Исходный массив</p>';
        echo '<pre>';
        print_r($arr);
        echo '</pre>';
        
        $maxValue = array_search(max($arr), $arr);
        $minValue = array_search(min($arr), $arr);
        echo "<p>Максимальное значение: {$arr[$maxValue]}</p>";
        echo "<p>Минимальное значение: {$arr[$minValue]}</p>";
        
        list($arr[$minValue], $arr[$maxValue]) = [$arr[$maxValue], $arr[$minValue]];
        echo '<p>Полученный массив</p>';
        echo '<pre>';
        print_r($arr);
        echo '</pre>';        
        ?>
    </body>
</html>