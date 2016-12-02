<?php

function afficher($langue){
	if($langue=="anglais"){
		require("vue/accueil_ang.html");
	}else{
		require("vue/Accueil_fr.html");
	}	
}

?>