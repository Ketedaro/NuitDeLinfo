<?php
function bdd(){
    try{
        $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
        //$bdd = new PDO('mysql:host=dm238890-001.privatesql;port=35142;dbname=mentable','michael','Romeoalpha0', $pdo_options);
        $bdd = new PDO('mysql:host=localhost;dbname=ia','root','', $pdo_options);
    }catch (Exception $e){
        die('Erreur : ' . $e->getMessage());
    }
    return $bdd;
}
?>