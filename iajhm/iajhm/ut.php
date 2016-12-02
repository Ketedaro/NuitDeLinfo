<?php

$json = json_decode(file_get_contents("test.json"));

$utterences = $json->{'utterances'};

for($i=0; $i<count($utterences); ++$i){
    echo $utterences[$i]->{'text'}."<br>";
}




?>