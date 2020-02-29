<?php
    echo '<html><head></head><body style="padding: 50px;"><div style="text-align: RIGHT;"><img src="https://i.imgur.com/lcmL8X6.png" alt="IICS Help Desk" height=128/></div>'
                                        . '<div style="font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;">'
                                        . '<h3>Looks like you forgot your Security Question, but do not worry</h3><p>We have provided an another way for you to reset your password.</p>'
                                        . '<p>Please use the given code to complete your password reset.</p>'
                                        . '<hr>'
                                        . '<p align="left"><b>Password Reset Code: </b>' . $vcode . '</p>'
                                        . '<hr><p style="font-weight: bold;">Please do not share to anyone your password reset code.</p></div></body></html>';
?>