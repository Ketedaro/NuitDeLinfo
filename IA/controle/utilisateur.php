<?php 

/*controleur utilisateur.php :
  ensemble de fonctions-action de gestion des utilisateurs
*/

function ident () {
	$mail=  isset($_POST['mail'])?($_POST['mail']):'';
	$password=  isset($_POST['password'])?($_POST['password']):'';
	$msg='';
	
	if  (count($_POST)==0) {
			require ("vue/ident.tpl") ;
			}
			else {
				require ("modele/utilisateurBD.php") ;
				if  (! verif_ident($mail, $password, $profil)) {
					$msg ="erreur de saisie";
					require ("vue/ident.tpl");
				}
				else {
					//Si se connecte bien
					$_SESSION['profil'] = $profil;
					//On regarde si c'est un élève ou un prof
					header("Location:index.php?controle=accueil&action=afficher&param=anglais");			
				}
	}	
}

//a compléter
function deconnexion(){
	session_destroy();
	//header pour passer par index.php et faire un session_start()
	header("Location:index.php?controle=utilisateur&action=ident");
}


