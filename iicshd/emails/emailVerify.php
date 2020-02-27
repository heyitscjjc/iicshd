<?php echo '<html><head></head><body style="padding: 50px;"><div style="text-align: RIGHT;"><img src="https://i.imgur.com/lcmL8X6.png" alt="IICS Help Desk" height=128/></div>'
    . '<div style="font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;">
        <h3>Thank you for signing up STUDENT!</h3>'
    . '<p>Please input the <b>code</b> to complete registration.</p>'
    . '<hr>'
    . '<p text-align="left"><b>Name: </b>' . $studfname . ' ' . $studlname . '</p>
       <p text-align="left"><b>User ID: </b>' . $studnum . '</p>
       <p text-align="left"><b>Code: </b>' . $vcode . '</p>'
    . '<hr><p style="font-weight: bold;">Please do not share your verification code to ensure security of your account.</p></div></body></html>';
?>
