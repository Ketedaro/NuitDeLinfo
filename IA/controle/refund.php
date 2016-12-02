<?php

function afficher($langue){
	if($langue=="anglais"){
		require("vue/refund_ang.html");
	}else{
		require("vue/refund_fr.html");
	}	
}

?>