<?php

$ip  = !empty($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
$url = "http://freegeoip.net/json/$ip";
$ch  = curl_init();

$lat = "48.846412";
$lon = "2.273365";

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
$data = curl_exec($ch);
curl_close($ch);

if ($data) {
    $location = json_decode($data);

    $lat = $location->latitude;
    $lon = $location->longitude;
}

include_once 'db.php';
include_once 'index.php';

$bdd = bdd();
$dist_max = 100;

if(isset($_POST['query'])){
    $query = htmlspecialchars($_POST['query']);
    echo processQuery($query, $bdd, $dist_max, $lat, $lon);
}