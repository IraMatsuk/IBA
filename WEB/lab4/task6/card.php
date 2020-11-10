<?php
$valet = 11;
$dama = 12;
$korol = 13;
$tuz = 14;

if($_SERVER['REQUEST_METHOD'] == 'POST') {
    
        $number = $_POST['number'];
        switch ($number) {
            case 6:
                echo 'Ваша карта: шестерка';
                break;
            case 7:
                echo 'Ваша карта: семерка';
                break;
             case 8:
                echo 'Ваша карта: восьмерка';
                break;
            case 9:
                echo 'Ваша карта: девятка';
                break;
            case 10:
                echo 'Ваша карта: десятка';
                break;
            case 11:
                echo 'Ваша карта: валет';
                break;
            case 12:
                echo 'Ваша карта: дама';
                break;
            case 13:
                echo 'Ваша карта: король';
                break;
            case 14:
                echo 'Ваша карта: туз';
                break;
            default:
                echo 'Карта не определена или неверный ввод';
                break;
        }
} 
?>