<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        $number = "2111";
        $sum = 0;

        for($i = 0; $i < strlen($number); $i++) {
            $sum += $number[$i];
        }

        echo 'Сумма чисел числа ', $number.": <br/>";
        echo $sum;
        ?>
    </body>
</html>
