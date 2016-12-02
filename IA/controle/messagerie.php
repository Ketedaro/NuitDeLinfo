<?php

function getDef($keyword){
    $url='http://lookup.dbpedia.org/api/search.asmx/KeywordSearch?QueryString='.urlencode($keyword).'&MaxHits=1';
    $xml=simplexml_load_file($url);
    if(isset($xml->Result->Description)){
    	return $xml->Result->Description;
    }else{
    	return("Sorry, i didn't understand your request");
    }
    
}

function envoyerMessage($message, $user){
	require("modele/messagerieBD.php");
	require("modele/IABD.php");
	enregistrerMes($message, $user);
	$reponse = declencherRep($message);
	enregistrerMes($reponse, $user);
}

?>