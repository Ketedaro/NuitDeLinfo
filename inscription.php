<?php
$msg='';
$pasErreur=false;

require './modele/inscription.php';

function inscrip(){
  if (isset($_POST['forminscription'])) {

    $nom = htmlspecialchars($_POST['nom']);
    $prenom = htmlspecialchars($_POST['prenom']);
    $mail = htmlspecialchars($_POST['mail']);
    $mail2 = htmlspecialchars($_POST['mail2']);
    $mdpSanscryptage = $_POST['mdp'];
    /**on crypte les mot de passe avant de les enregisté dans la base de données*/
    $mdp = sha1($_POST['mdp']);
    $mdp2 = sha1($_POST['mdp2']);
    $role = $_POST['role'];
    if (!empty($_POST['nom']) and !empty($_POST['prenom']) and !empty($_POST['mail']) and !empty($_POST['mail2']) and !empty($_POST['mdp']) and !empty($_POST['mdp2'])) {
      $nomlength = strlen($nom);
      if ($nomlength <= 255) {
        if ($mail == $mail2) {
          if (filter_var($mail, FILTER_VALIDATE_EMAIL)) {
            if (mailExiste($mail)) {
              if ($mdp == $mdp2) {
                if(testmdp($mdpSanscryptage)){
                  if($role =="prof"){
                    nouveauProfesseur($nom, $prenom, $mail, $mdp);
                    $GLOBALS['msg'] = 'Bienvenue professeur '.$nom.' Votre compte a bien ete cree ! <a href="connexion.php">Me connecter</a>';
                    $GLOBALS['pasErreur']=true;
                  }else{
                    nouveauEtudiant($nom, $prenom, $mail, $mdp);
                    $GLOBALS['msg'] = 'Bienvenue '.$prenom.' ! Votre compte a bien ete cree ! <a href="index.php">Me connecter</a>';
                    $GLOBALS['pasErreur']=true;
                  }
                }
              } else {
                $GLOBALS['msg']= 'Vos mots de passes ne correspondent pas !';
              }
            } else {
              $GLOBALS['msg'] = 'Adresse mail déjà utilise !';
            }
          } else {
            $GLOBALS['msg'] = "Votre adresse mail n'est pas valide !";
          }
        } else {
          $GLOBALS['msg'] = 'Vos adresses mail ne correspondent pas !';
        }
      } else {
        $GLOBALS['msg'] = 'Votre nom ne doit pas depasser 255 caracteres !';
      }
    } else {
      $GLOBALS['msg'] = 'Tous les champs doivent etre completes !';
    }

  }
  require './vue/inscription.html';
}
/**test si le mot de passe correspond au exigence**/
function testmdp($mdp)	{
  $longueur=strlen($mdp);
  if ($longueur >=6){
    if (preg_match("~[\W]~", $mdp) ) {
      $GLOBALS['msg']="le mot de passe doit uniquement contenir des lettres ou des chiffres !";
      return false;
    }
    if(!preg_match("/[a-z][0-9]|[a-z][0-9]/",$mdp)){
      $GLOBALS['msg']="le mot de passe doit comporter au moins une lettre et un chiffre";
      return false;
    }
    if(!preg_match("~[A-Z]~",$mdp)){
      $GLOBALS['msg']="le mot de passe doit comporter au moins une lettre majuscule";
      return false;
    }
    return true;

  }else{
    $GLOBALS['msg']='votre mot de passe doit contenir au moins 6 caratères';
    return false;
  }

}

/***recupere l'erreur **/
function getErreur()
{

  if(!empty($GLOBALS['msg'])){
    if($GLOBALS['pasErreur']){
      return  '<h2 id="msgBon">'.$GLOBALS['msg'].'</h2>';
    }else{
      return  '<h2 id="msgErreur">'.$GLOBALS['msg'].'</h2>';
    }

  }
}


?>
