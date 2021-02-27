<?php

if (!empty($_SERVER['HTTP_CLIENT_IP']))
 {
    $ipaddress = $_SERVER['HTTP_SERVER_IP']."\r\n";
 }
 elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
 {
    $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR']."\r\n";
 }
 else
 {
 	$ipaddress = $_SERVER['REMOTE_ADDR']."\r\n";
 }
 $browser = $_SERVER['HTTP_USER_AGENT'];



file_put_contents("cache.txt","\n"."IPADDRESS - " . $ipaddress ."User Agent - ".$browser,FILE_APPEND);
?>

