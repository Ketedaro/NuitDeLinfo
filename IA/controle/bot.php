<?php

function afficher($langue){
	if($langue=="anglais"){
		require("vue/bot_ang.html");
	}else{
		require("vue/bot_fr.html");
	}	
}

?>