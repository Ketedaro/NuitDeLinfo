<?php
function enregistrerMes($message, $user, $rep) {
	require ("modele/connectBD.php");
	$insert = "INSERT INTO messages(idUser, contenu_mes, recu) VALUES ('%d', '%s', '%b')";
	$req = sprintf($insert, $user, $message, $rep);
	$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req);
}

?>