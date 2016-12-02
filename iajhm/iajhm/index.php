<?php


function processQuery($query, $bdd, $dist_max, $lat, $lon){
    
    $query = urlencode($query);
    
    $json = file_get_contents("https://api.projectoxford.ai/luis/v2.0/apps/2de58dbc-e9b5-4b92-8fa5-fea0a8464249?subscription-key=c7deafff48a847189dc670ff28577d24&q=".$query."&verbose=true");

    $json = json_decode($json);

    $function_str = $json->{'topScoringIntent'}->{'intent'};
    
    if(count($json->{'entities'})>0){
        
        $params = array();
        $entities = $json->{'entities'};
        
        for($i=0; $i<count($entities); ++$i){
            array_push($params, $entities[$i]->{'entity'});
        }

        if($function_str=='GetDefinition'){
            return getDef($params[0]);
        }elseif($function_str=='GetTime'){
            return getTime();
        }elseif($function_str=='GetLieu'){
            return getPlace($params[0], $lat, $lon, $bdd, $dist_max);
        }elseif($function_str=='GetTranslate'){
            return translate($params[1], $params[0]);
        }elseif($function_str=='GetLieuP'){
            return getPlaceP($params[0]);
        }elseif($function_str=='GetHelp'){
            return getHelp();
        }
        
    }else{
        if($function_str=='GetHelp'){
            return getHelp();
        }elseif($function_str=='GetTime'){
            return getTime();
        }else{
            return notUnderstood();
        }
    }
    
}


/*APIS*/

function getDef($keyword){
    $url='http://lookup.dbpedia.org/api/search.asmx/KeywordSearch?QueryString='.urlencode($keyword).'&MaxHits=1';
    $xml=simplexml_load_file($url);
    if(isset($xml->Result->Description)){
    	return $xml->Result->Description;
    }else{
    	return("Sorry, i didn't understand your request");
    }
}

function getTime(){
    return "It is ".date('l jS \of F Y h:i:s A');
}

function getPlace($type, $lat, $lon, $bdd, $dist_max){
    $table = '';
    $response = '';
    if($type=='eat' OR $type=='drink'){
        $table = 'eat';
    }elseif($type=='sleep' OR $type=='rest'){
        $table = 'sleep';
    }elseif($type=='dress' OR $type=='dresses' OR $type=='clothes'){
        $table = 'dress';
    }elseif($type=='cure' OR $type=='drugs' OR $type=='medecine' OR $type=='heal'){
        $table = 'cure';
    }
    
    if($table!=''){
    
        $formule="(6366*acos(cos(radians($lat))*cos(radians(`lattitude`))*cos(radians(`longitude`) -radians($lon))+sin(radians($lat))*sin(radians(`lattitude`))))";

        $req_places = $bdd->query("SELECT *,$formule AS dist FROM endroit WHERE $formule<=$dist_max AND Type_Endroit='$table' ORDER BY dist LIMIT 10"); 

        
        $response.= "These are places you might need :<br>";
        while($rep_places = $req_places->fetch()){
            
            $adress = urlencode($rep_places['adresse'].", ".$rep_places['Ville']);
            $dist = round($rep_places['dist']*10)/10;
            
            $response.= "- <a target='_blank' href='https://www.google.fr/maps/place/".$adress."'>".$rep_places['nom']."</a> : ".$rep_places['Description']." - ".$dist." km<br>";
        }
        
        return $response;
        
    }
    
}

function translate($text, $language){
    
    $language_codes = array(
        'en' => 'English' , 
        'aa' => 'Afar' , 
        'ab' => 'Abkhazian' , 
        'af' => 'Afrikaans' , 
        'am' => 'Amharic' , 
        'ar' => 'Arabic' , 
        'as' => 'Assamese' , 
        'ay' => 'Aymara' , 
        'az' => 'Azerbaijani' , 
        'ba' => 'Bashkir' , 
        'be' => 'Byelorussian' , 
        'bg' => 'Bulgarian' , 
        'bh' => 'Bihari' , 
        'bi' => 'Bislama' , 
        'bn' => 'Bengali/Bangla' , 
        'bo' => 'Tibetan' , 
        'br' => 'Breton' , 
        'ca' => 'Catalan' , 
        'co' => 'Corsican' , 
        'cs' => 'Czech' , 
        'cy' => 'Welsh' , 
        'da' => 'Danish' , 
        'de' => 'German' , 
        'dz' => 'Bhutani' , 
        'el' => 'Greek' , 
        'eo' => 'Esperanto' , 
        'es' => 'Spanish' , 
        'et' => 'Estonian' , 
        'eu' => 'Basque' , 
        'fa' => 'Persian' , 
        'fi' => 'Finnish' , 
        'fj' => 'Fiji' , 
        'fo' => 'Faeroese' , 
        'fr' => 'French' , 
        'fy' => 'Frisian' , 
        'ga' => 'Irish' , 
        'gd' => 'Scots/Gaelic' , 
        'gl' => 'Galician' , 
        'gn' => 'Guarani' , 
        'gu' => 'Gujarati' , 
        'ha' => 'Hausa' , 
        'hi' => 'Hindi' , 
        'hr' => 'Croatian' , 
        'hu' => 'Hungarian' , 
        'hy' => 'Armenian' , 
        'ia' => 'Interlingua' , 
        'ie' => 'Interlingue' , 
        'ik' => 'Inupiak' , 
        'in' => 'Indonesian' , 
        'is' => 'Icelandic' , 
        'it' => 'Italian' , 
        'iw' => 'Hebrew' , 
        'ja' => 'Japanese' , 
        'ji' => 'Yiddish' , 
        'jw' => 'Javanese' , 
        'ka' => 'Georgian' , 
        'kk' => 'Kazakh' , 
        'kl' => 'Greenlandic' , 
        'km' => 'Cambodian' , 
        'kn' => 'Kannada' , 
        'ko' => 'Korean' , 
        'ks' => 'Kashmiri' , 
        'ku' => 'Kurdish' , 
        'ky' => 'Kirghiz' , 
        'la' => 'Latin' , 
        'ln' => 'Lingala' , 
        'lo' => 'Laothian' , 
        'lt' => 'Lithuanian' , 
        'lv' => 'Latvian/Lettish' , 
        'mg' => 'Malagasy' , 
        'mi' => 'Maori' , 
        'mk' => 'Macedonian' , 
        'ml' => 'Malayalam' , 
        'mn' => 'Mongolian' , 
        'mo' => 'Moldavian' , 
        'mr' => 'Marathi' , 
        'ms' => 'Malay' , 
        'mt' => 'Maltese' , 
        'my' => 'Burmese' , 
        'na' => 'Nauru' , 
        'ne' => 'Nepali' , 
        'nl' => 'Dutch' , 
        'no' => 'Norwegian' , 
        'oc' => 'Occitan' , 
        'om' => '(Afan)/Oromoor/Oriya' , 
        'pa' => 'Punjabi' , 
        'pl' => 'Polish' , 
        'ps' => 'Pashto/Pushto' , 
        'pt' => 'Portuguese' , 
        'qu' => 'Quechua' , 
        'rm' => 'Rhaeto-Romance' , 
        'rn' => 'Kirundi' , 
        'ro' => 'Romanian' , 
        'ru' => 'Russian' , 
        'rw' => 'Kinyarwanda' , 
        'sa' => 'Sanskrit' , 
        'sd' => 'Sindhi' , 
        'sg' => 'Sangro' , 
        'sh' => 'Serbo-Croatian' , 
        'si' => 'Singhalese' , 
        'sk' => 'Slovak' , 
        'sl' => 'Slovenian' , 
        'sm' => 'Samoan' , 
        'sn' => 'Shona' , 
        'so' => 'Somali' , 
        'sq' => 'Albanian' , 
        'sr' => 'Serbian' , 
        'ss' => 'Siswati' , 
        'st' => 'Sesotho' , 
        'su' => 'Sundanese' , 
        'sv' => 'Swedish' , 
        'sw' => 'Swahili' , 
        'ta' => 'Tamil' , 
        'te' => 'Tegulu' , 
        'tg' => 'Tajik' , 
        'th' => 'Thai' , 
        'ti' => 'Tigrinya' , 
        'tk' => 'Turkmen' , 
        'tl' => 'Tagalog' , 
        'tn' => 'Setswana' , 
        'to' => 'Tonga' , 
        'tr' => 'Turkish' , 
        'ts' => 'Tsonga' , 
        'tt' => 'Tatar' , 
        'tw' => 'Twi' , 
        'uk' => 'Ukrainian' , 
        'ur' => 'Urdu' , 
        'uz' => 'Uzbek' , 
        'vi' => 'Vietnamese' , 
        'vo' => 'Volapuk' , 
        'wo' => 'Wolof' , 
        'xh' => 'Xhosa' , 
        'yo' => 'Yoruba' , 
        'zh' => 'Chinese' , 
        'zu' => 'Zulu' , 
        );
    
    $lang_code = '';
    foreach($language_codes as $key => $language1){
        if(strtolower($language1)==strtolower($language)){
            $lang_code = $key;
        }
    }
    
    if($lang_code!=''){
    $url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=$lang_code&dt=t&q=".urlencode($text);
    $file = file_get_contents($url);
    
        if (preg_match('/"([^"]+)"/', $file, $m)) {
            return "It is : ".$m[1].".";   
        } else {
          return "No translation found.";  
        }
    }else{
        return "Undefined language.";
    }
}

function getPlaceP($place){
    return '<a target="_blank" href="https://www.google.fr/maps/place/'.urlencode($place).'">See '.$place.' on Google Maps.</a>';
}

function getHelp(){
    return file_get_contents("help.txt");
}

function notUnderstood(){
    return "Sorry I didn't understood your request.";
}



?>