<?php
    echo '<html><head></head><body style="padding: 50px;"><div style="text-align: RIGHT;"><img src="https://i.imgur.com/lcmL8X6.png" alt="IICS Help Desk" height=128/></div>'
                                        . '<div style="font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;">'
                                        . '<h3>Hello there,</h3><p>You have requested for a password reset. If you did not request for a password reset, we strongly recommend for you to log in with the temporary password and then change your password.</p>'
                                        . '<p>Please use the given <b>temporary password</b> for logging-in.</p>'
                                        . '<hr>'
                                        . '<p align="left"><b>Temporary Password: </b>' . $temp_pass . '</p>'
                                        . '<hr><p style="font-weight: bold;">Please do not share to anyone your temporary password</p></div></body></html>';
?>