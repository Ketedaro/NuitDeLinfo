<?php
/*Fonctions-modèle réalisant les requètes de gestion des utilisateurs en base de données*/

// verif_ident : fonction booléenne de vérification de l'utilisateur en base de données 
// Si ok, alors le profil de l'utilisateur, à savoir son enregistrement, est affecté en sortie à $profil
function verif_ident($log, $password, &$profil) {
	require ("modele/connectBD.php") ; 
	$link = mysqli_connect($hote, $login, $pass) 
		or die ("erreur de connexion :" . mysql_error()); 
	mysqli_select_db($link, $bd) 
		or die (utf8_encode("erreur d'accès à la base :") . $bd);

	$select = "select * from users where email='%s' and password='%s'"; 
	$req = sprintf($select, $log, $password);
	
	$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req);

	if (mysqli_num_rows ($res) > 0) {
		$f = utf8_encode('Résultat de la base : <br/>');
		$profil = mysqli_fetch_assoc($res);
		return true;
	}
	return false;
}


function creerUtilisateur($idUser, $firstNameUser, $lastNameUser, $suscribeDateUser, $email, $password){
	require ("modele/connectBD.php") ; 
	$insert = "INSERT INTO users(idUser, firstNameUser, lastNameUser, suscribeDateUser, email, password) VALUES ('%d', '%d', '%d', '%d', '%d', '%d')";
	$req = sprintf($insert, $idUser, $firstNameUser, $lastNameUser, $suscribeDateUser, $email, $password, 'Refugie');
	$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req);

}

function creerAssociation($idUser, $firstNameUser, $suscribeDateUser, $email, $password){
	require ("modele/connectBD.php") ; 
		$insert = "INSERT INTO users(idUser, firstNameUser, suscribeDateUser, email, password) VALUES ('%d', '%d', '%d', '%d', '%d')";
	$req = sprintf($insert, $idUser, $firstNameUser, $suscribeDateUser, $email, $password, 'Association');
	$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req);

}




?>