<?php

require '../../include/controller.php';
use PHPMailer\PHPMailer\PHPMailer;
require '../../include/PHPMailer/src/SMTP.php';
require '../../include/PHPMailer/src/Exception.php';
require '../../include/PHPMailer/src/PHPMailer.php';

if (isset($_SESSION['user_name']) && $_SESSION['role'] == "admin") {
    header("location:/iicshd/user/admin/home.php");
}
if (isset($_SESSION['user_name']) && $_SESSION['role'] == "faculty") {
    header("location:/iicshd/user/faculty/home.php");
}


if (isset($_SESSION['user_name'])) {

    if ((time() - $_SESSION['last_time']) > 2000) {
        header("Location:../../logout.php");
    } else {
        $_SESSION['last_time'] = time();
    }
}

if (!isset($_SESSION['user_name'])) {
    header("location:/iicshd/login.php");
}


$mail = new PHPMailer;

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'noreply.iicshd@gmail.com';                 // SMTP username
$mail->Password = '1ng0dw3trust';                           // SMTP password
$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 587;     

    //CHATBOT COMMANDS
    function connectionError($errno, $errstr) {
        echo "Something went wrong. Try again later.";
        die();
      }
    if(isset($_POST['send'])){
        array_push($_SESSION['previousMessages'], "You: " .  $_POST['query']);
    }
    if(isset($_POST['btnNone'])){
        $_REQUEST['query']="goodbye";
        array_push($_SESSION['previousMessages'], "You: " .  "None");
        try {
            $conversation = implode(',', $_SESSION['previousMessages']);
            //Recipients
            $mail->setFrom('noreply.iicshd@gmail.com', 'IICS Help Desk');
            $mail->addAddress($_SESSION['studemail']);
            $mail->addReplyTo('noreply.iicshd@gmail.com', 'IICS Help Desk'); // Add a recipient

            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = 'IICS Help Desk | Conversation with the Assistant';
            $mail->Body = '<html><head></head><body><div align="center"><img src="https://i.imgur.com/yqJNKhh.png" alt="IICS Help Desk"/></center>'
                    . '<p>Nice talking with you.</p>'
                    . '<p>Here is our conversation earlier. You can use this as a reference in the future.</p>'
                    . $conversation
                    . '<hr></body></html>';

            $mail->send();
        } catch (Exception $ex) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }
#chatbot function
function sendMessage(){
    set_error_handler("connectionError");
    $workspace = '01ae9e7d-7a59-43bf-8db7-5392661441cd';
    $username = 'apikey';
    $password = '5n_o_uV8056uGeLj2asr9TIYoGvLy0gJyW84gpd_bPbN';
    $version = '2019-12-09';
    $gateway = 'https://gateway.watsonplatform.net/assistant/api'; // Dallas
    //$gateway = 'https://gateway-wdc.watsonplatform.net/assistant/api'; // Washington, DC
    //$gateway = 'https://gateway-fra.watsonplatform.net/assistant/api'; // Frankfurt
    //$gateway = 'https://gateway-syd.watsonplatform.net/assistant/api'; // Sydney
    //$gateway = 'https://gateway-tok.watsonplatform.net/assistant/api'; // Tokyo
    //$gateway = 'https://gateway-lon.watsonplatform.net/assistant/api'; // London

    # End configuration

    if(isset($_REQUEST['reset'])) {
        session_destroy();
        $_SESSION = null;
        $destination = 'http://'.$_SERVER['HTTP_HOST'].'/'.$_SERVER['PHP_SELF'];
        header('Location: '.$destination);
        exit;
    }

    if(!isset($_SESSION['context'])) {
        $_SESSION['context'] = null;
    }

    if(isset($_REQUEST['query'])) {
        $query = $_REQUEST['query'];
    }
    else {
        $query = null;
    }

    $curl = curl_init();
    $context = json_encode($_SESSION['context']);
    $data = '{"input": {"text": "'.$query.'"}, "context": '.$context.'}';

    curl_setopt_array($curl, array(
        CURLOPT_HTTPHEADER => array('Content-type: application/json'),
        CURLOPT_POST => true,
        CURLOPT_URL => "$gateway/v1/workspaces/$workspace/message?version=$version",
        CURLOPT_USERPWD => "$username:$password",
        CURLOPT_POSTFIELDS => $data,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => true
    ));

    $response = curl_exec($curl);

    $err = curl_error($curl);
    curl_close($curl);
    $response = json_decode($response);
    //$_SESSION['context'] = $response->context;
    $output = implode('<br>', $response->output->text);

    if($query != null) {

    }
    $reply = $output;
    $_SESSION['repliedMessage']=$reply;
    array_push($_SESSION['previousMessages'], "Assister: " .  $reply);
    echo $reply;
}

?><!DOCTYPE html>
<html lang="en">
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../img/favicon.png">
    <link rel="shortcut icon" href="img/favicon.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>IICS Help Desk</title>

    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dashboard.css" rel="stylesheet">
    <link href="../../fa-5.5.0/css/fontawesome.css" rel="stylesheet">

    <!-- Font Awesome JS -->
    <script defer src="../../fa-5.5.0/js/solid.js"></script>
    <script defer src="../../fa-5.5.0/js/fontawesome.js"></script>

    <style>
        .header {
            padding: 10px;
            text-align: center;
            background: #2e2e2e;
            color: white;
            font-size: 30px;
            position:fixed;
            bottom:0;                
            border-top: 5px solid #b00f24;
        }
    </style>

    <link rel="stylesheet" href="../../DataTables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../DataTables/Responsive-2.2.1/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../DataTables/Buttons-1.5.1/css/buttons.dataTables.min.css">
</head>
<body>
<?php 
        include '../../navbar.php';
    ?>
<main>

</main>

<script type="text/javascript">
    document.getElementById("query").focus();
</script>


<div class="container-fluid" style="padding:150px;">
    <p style='text-align: right;'><button class="btn" name="clear">Delete conversation and start over</button></p>
    <?php
    foreach ($_SESSION['previousMessages']  as $key => $val) {
        echo $val;
        echo "<hr>";
     }
    ?>
    <form method="post" autocomplete="off">
        <br><h3><span class="icon-utility-live-chat"></span><?php sendMessage(); ?></h3>
        <?php
            if(strpos($_SESSION['repliedMessage'], "Anything else")){
                echo "<button class='btn' name='btnNone'>None</button>";
            }
        ?>
        <br><br><input type="text" id="query" name="query" class="form-control" placeholder="Send a message...">
        <br><button class="btn" name="send">Send message</button>
    </form>
</div>
</body>
</html>