<?php

function liker($user, $idLieu){
	require("modele/formumBD.php");
	if(aLikeBD($user, $idLieu)=="rien"){
		likeBD($user, $idLieu, true);
	}else if(aLikeBD($user, $idLieu)=="dislike"){
		enleverLikeBD($user, $idLieu);
		likeBD($user, $idLieu, true);
	}
}

function disliker($user, $idLieu){
	require("modele/formumBD.php");
	if(aLikeBD($user, $idLieu)=="rien"){
		likeBD($user, $idLieu, false);
	}else if(aLikeBD($user, $idLieu)=="like"){
		enleverLikeBD($user, $idLieu);
		likeBD($user, $idLieu, false);
	}
}

function afficher(){
	require("modele/formumBD.php");
	$articles = array();
	$lieux = endroitsBD();
	for($i=0; i < count($lieux); ++i){
		$articles[$i]['titre'] = $lieux[$i]['Type_Endroit'];
		$articles[$i]['descr'] = $lieux[$i]['Description'];
		$articles[$i]['like'] = nbLikeBD($lieux[$i]['id_endroit']);
		$articles[$i]['dislike'] = nbDislikeBD($lieux[$i]['id_endroit']);
		$articles[$i]['ville'] = $lieux[$i]['Ville'];
		$articles[$i]['Code Postal'] = $lieux[$i]['Code Postal'];
	}
	require("vue/forum.php");
}

?>