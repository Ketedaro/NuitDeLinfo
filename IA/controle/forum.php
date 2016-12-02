<?php

function liker($idLieu, $langue){
	$user = $_SESSION['profil']['idUser'];
	require("modele/forumBD.php");
	if(aLikeBD($user, $idLieu)=="rien"){
		likeBD($user, $idLieu, true);
	}else if(aLikeBD($user, $idLieu)=="dislike"){
		enleverLikeBD($user, $idLieu);
		likeBD($user, $idLieu, true);
	}else{
		enleverLikeBD($user, $idLieu);
	}
	header("Location:index.php?controle=forum&action=afficher&param=$langue");
}

function disliker($idLieu, $langue){
	$user = $_SESSION['profil']['idUser'];
	require("modele/forumBD.php");
	if(aLikeBD($user, $idLieu)=="rien"){
		likeBD($user, $idLieu, false);
	}else if(aLikeBD($user, $idLieu)=="like"){
		enleverLikeBD($user, $idLieu);
		likeBD($user, $idLieu, false);
	}else{
		enleverLikeBD($user, $idLieu);
	}
	header("Location:index.php?controle=forum&action=afficher&param=$langue");
}

function afficher($langue){
	require("modele/forumBD.php");
	$article = array();
	$lieux = endroitsBD();
	for($i=0; $i < count($lieux); ++$i){
		$article[$i]['titre'] = $lieux[$i]['Type_Endroit'];
		$article[$i]['descr'] = $lieux[$i]['Description'];
		$article[$i]['like'] = nbLikeBD($lieux[$i]['id_endroit']);
		$article[$i]['dislike'] = nbDislikeBD($lieux[$i]['id_endroit']);
		$article[$i]['ville'] = $lieux[$i]['Ville'];
		$article[$i]['CP'] = $lieux[$i]['Code Postal'];
		$article[$i]['nom'] = $lieux[$i]['nom'];
		$article[$i]['adresse'] = $lieux[$i]['adresse'];
		$article[$i]['idLieu'] = $lieux[$i]['id_endroit'];
	}
	if($langue=="anglais"){
		require("vue/forum_ang.html");
	}else{
		require("vue/forum_fr.html");
	}
}

function formulaire($langue){
	if($langue=="anglais"){
		require("vue/form_ang.html");
	}else{
		require("vue/form_fr.html");
	}
}

?>