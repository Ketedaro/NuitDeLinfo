<?php

$hote="localhost";   		
$login="philippe1";  		
$pass=$login;	
$bd="dut2_philippe1";


if (! isset($link)) {
	$link = mysqli_connect($hote, $login, $pass) 
			or die ("erreur de connexion :" . mysql_error()); 
	mysqli_select_db($link, $bd) 
			or die (htmlentities("erreur d'accès à la base :") . $bd);
}
?>