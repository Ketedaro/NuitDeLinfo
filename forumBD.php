<?php

function aLikeBD($idUser,$idEndroit){

		try
	{
		// On se connecte à MySQL
		$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}

		$req = $bdd->prepare('SELECT * FROM aime WHERE idUser = :idUser AND idEndroit= :idEndroit');
		$req->execute(array('idUser' => $idUser, 'idEndroit' => $idEndroit));

		$rep = $req->fetch();

		if($rep == null){
			return 'rien';
		}else{
			if($rep['aime'] == true){
				return "like";
			}else{
				return "dislike";
			}
		}

}

function likeBD($idUser,$idEndroit,$boolLike){

	try
	{
		// On se connecte à MySQL
		$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}

	$req = $bdd->prepare('INSERT INTO aime(idUser, idEndroit, aime) VALUES(:idUser, :idEndroit, :boolLike)');

	$req->execute(array('idUser' => $idUser,'idEndroit' => $idEndroit,'boolLike' => $boolLike));


}

function enleverLikeBD($idUser,$idLieu){

	try
	{
		// On se connecte à MySQL
		$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}

	$req = $bdd->prepare('DELETE from aime WHERE idUser = :idUser , idEndroit = :idEndroit');
	
	$req->execute(array(

			'idUser' => $idUser,
			'idEndroit' => $idEndroit
			));
}

function getEndroitBD($idLieu){
	try
		{
			// On se connecte à MySQL
			$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
		}
		catch(Exception $e)
		{
			// En cas d'erreur, on affiche un message et on arrête tout
		        die('Erreur : '.$e->getMessage());
		}

		$req = $bdd->prepare('SELECT *  FROM Endroit where idEndroit = :idEndroit');
		$req->execute(array('idEndroit' => $idEndroit));

		$rep = $req->fetch();
		return $rep;
}

function nbLikeBD($idEndroit){
	try
	{
		// On se connecte à MySQL
		$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}

	$req = $bdd->prepare('SELECT count(idEndroit) as nb FROM aime WHERE idEndroit= :idEndroit AND aime = true GROUP BY idEndroit');

	$req->execute(array('idEndroit' => $idEndroit));

	$rep = $req->fetch();	

	return $rep['nb'];



}

function nbDislikeBD($idEndroit){
	try
	{
		// On se connecte à MySQL
		$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}

	$req = $bdd->prepare('SELECT count(idEndroit) as nb FROM aime WHERE idEndroit= :idEndroit AND aime = false GROUP BY idEndroit');

	$req->execute(array('idEndroit' => $idEndroit));

	$rep = $req->fetch();	

	return $rep['nb'];



}

function nbEndroitsBD(){
		try
	{
		// On se connecte à MySQL
		$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}

	$req = $bdd->prepare('SELECT count(idEndroit) as nb FROM Endroit  GROUP BY idEndroit');

	$req->execute(array());

	$rep = $req->fetch();	

	return $rep['nb'];
}


function endroitsBD(){
		try
	{
		// On se connecte à MySQL
		$bdd = new PDO('mysql:host=localhost;dbname=refugier;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
	        die('Erreur : '.$e->getMessage());
	}

	$req = $bdd->prepare('SELECT *  FROM Endroit ');
	$req->execute(array());

	$ret = array();

	while ($donnees = $req->fetch())
	{
		$ret[] = $donnees;
	}

	return $ret;	

}

?>