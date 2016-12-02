<?php

function mailExiste($mail){
  //connexion a la base de donn�es
  require './modele/connectSQL.php';
  $reqmail = $bdd->prepare('SELECT * FROM professeur p ,etudiant e WHERE p.email = ? OR e.email = ?');
  $reqmail->execute(array($mail,$mail));
  $mailexist = $reqmail->rowCount();
  if ($mailexist == 0) {
    return true;
  }
  else{
    return false;
  }
}
function nouveauEtudiant($nom, $prenom, $mail, $mdp){
  //connexion a la base de donn�es
  require './modele/connectSQL.php';
  $insertetu = $bdd->prepare('INSERT INTO etudiant(nom, prenom, email, passe,id_promo) VALUES(?, ?, ?, ?,1)');
  $insertetu->execute(array($nom, $prenom, $mail, $mdp));
}
function nouveauProfesseur($nom, $prenom, $mail, $mdp){
  //connexion a la base de donn�es
  require './modele/connectSQL.php';
  $insertprof = $bdd->prepare('INSERT INTO professeur(nom, prenom, email, passe) VALUES(?, ?, ?, ?)');
  $insertprof->execute(array($nom, $prenom, $mail, $mdp));
}

?>
