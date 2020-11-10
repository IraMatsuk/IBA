<?php
if($_SERVER['REQUEST_METHOD'] == 'POST') {
        $surname = $_POST['surname'];
	$name = $_POST['name'];
        $lastname = $_POST['lastname'];
	     
	echo 'Полные ФИО: ' . $surname." ".$name." ".$lastname."<br />";        
        echo 'Сокращенный вариант: ' . $surname. ' ' . mb_substr($name, 0 , 1) . '.' . mb_substr($lastname, 0 , 1) . '.';
} 
?>