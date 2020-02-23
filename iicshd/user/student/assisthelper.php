<?php
    require '../../include/controller.php';
    use PHPMailer\PHPMailer\PHPMailer;
    require '../../include/PHPMailer/src/SMTP.php';
    require '../../include/PHPMailer/src/Exception.php';
    require '../../include/PHPMailer/src/PHPMailer.php';

    $mail = new PHPMailer;

    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = 'noreply.iicshd@gmail.com';                 // SMTP username
    $mail->Password = '1ng0dw3trust';                           // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;     
    $style = "style='display:float;'";

    //CHATBOT COMMANDS
    function connectionError($errno, $errstr) {
        echo "Can't connect to the internet. Try again later.";
        die();
      }
    if(isset($_POST['send'])){
        array_push($_SESSION['previousMessages'], "You: " .  $_POST['query']);
    }
    if(isset($_POST['btnYes'])){
        $_REQUEST['query']="Yes";
        array_push($_SESSION['previousMessages'], "You: " .  "Yes");
    }
    if(isset($_POST['btnNone'])){
        try {
            $_SESSION['context'] = null;
            $style = "style='display:none;'";
            $_REQUEST['query']="goodbye";
            array_push($_SESSION['previousMessages'], "You: " .  "None");
            array_push($_SESSION['previousMessages'], "-END OF CONVERSATION-");
            $conversation = implode( "<p>", $_SESSION['previousMessages']);
            $messageBody = '<html><head></head><body><div align="center"><img src="https://i.imgur.com/yqJNKhh.png" alt="IICS Help Desk"/></center>'
            . '<h2>Nice talking with you.</h2>'
            . '<p>Here is our conversation earlier. You can use this as a reference in the future.</p>'
            . $conversation
            .'<hr></body></html>';
            //Recipients
            $mail->setFrom('noreply.iicshd@gmail.com', 'IICS Help Desk');
            $mail->addAddress($_SESSION['email']);
            $mail->addReplyTo('noreply.iicshd@gmail.com', 'IICS Help Desk'); // Add a recipient

            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = 'IICS Help Desk | Conversation with the Assistant';
            $mail->Body = $messageBody;
            $mail->send();
            $_SESSION['previousMessages'] = array();
            $_SESSION['context'] = null;
        } catch (Exception $ex) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }
    if(isset($_POST['btnGetTicket'])){
        array_push($_SESSION['previousMessages'], "You pressed on 'Get a ticket' to generate a ticket.");
        header("location:/iicshd/user/student/queue.php#getQueue");
        exit();
    }
    if(isset($_POST['btnDocs'])){
        array_push($_SESSION['previousMessages'], "You pressed on 'View submitted Documents'.");
        header("location:/iicshd/user/student/documents.php");
        exit();
    }
    if(isset($_POST['btnClassSchedule'])){
        $_REQUEST['query']="View Schedules";
        array_push($_SESSION['previousMessages'], "You: " .  "View Schedules");
    }
    if(isset($_POST['btnTrack'])){
        $_REQUEST['query']="Track Documents";
        array_push($_SESSION['previousMessages'], "You: " .  "Track Documents");
    }
    if(isset($_POST['btnDeleteConvo'])){
        $_SESSION['previousMessages'] = array();
        $_SESSION['context'] = null;    }
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
            $_SESSION['previousMessages'] = array();
        }

        if(isset($_REQUEST['query'])) {
            $query = $_REQUEST['query'];
        }
        else {
            $query = "Hello";
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
        $_SESSION['context'] = $response->context;
        $output = implode('<br>', $response->output->text);

        if($query != null) {

        }
        $reply = $output;
        $_SESSION['repliedMessage']=$reply;


        if(end($_SESSION['previousMessages']) != "Virtual Helper: " .  $reply){
            array_push($_SESSION['previousMessages'], "Virtual Helper: " .  $reply);
        }
        echo $reply;
    }


?>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../img/favicon.png">

        <title>IICS Help Desk</title>

        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/dashboard.css" rel="stylesheet">
        <link href="../../fa-5.5.0/css/fontawesome.css" rel="stylesheet">

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
            /* .btn{
                transition-duration: 0.10s;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #800000;
                color: white;
            } */
        </style>

        <!-- Font Awesome JS -->
        <script defer src="../../fa-5.5.0/js/solid.js"></script>
        <script defer src="../../fa-5.5.0/js/fontawesome.js"></script>
    </head>

    <body>
    
    <?php 
        include '../../navbar.php';
    ?>

	<script type="text/javascript">
    document.getElementById("query").focus();
</script>


<div class="container mt-5 p-5 w-50" style="border-radius: .25rem; background-color: #ecf0f1;">
    <form method="post" autocomplete="off" onkeydown="return event.key != 'Enter';">
        <p style="text-align: right;"><button class="btn text-white" style="background-color: #6D0000;" name="btnDeleteConvo">Delete conversation and start over</button></p><br>
        <div class="p-3" style="background-color: white; border-radius: .25rem;">
        <?php
            if(is_array(@$_SESSION['previousMessages'])){
                foreach (@$_SESSION['previousMessages']  as $key => $val) {
                    echo $val;
                    echo "<hr>";
                }
            }
            ?>
        </div>
        <br><h3><span class="icon-utility-live-chat"></span><?php sendMessage(); ?></h3>
        <?php
            if(strpos($_SESSION['repliedMessage'], "Anything else")){
                echo "<button class='btn' name='btnYes'>Yes, there's something else</button>";
                echo " <button class='btn' name='btnNone'>None</button>";
            }
            if(strpos($_SESSION['repliedMessage'], "ticket")){
                echo " <a href='queue.php#getQueue' target='_blank'> <button class='btn' name='btnGetTicket'>Open a ticket</button></a>";
                echo " <button class='btn' name='btnYes'>Yes, I have already submitted one</button>";
            }
            if(strpos($_SESSION['repliedMessage'], "track")){
                echo "<button class='btn' name='btnDocs'>Visit Documents page</button>";
            }
            if(strpos($_SESSION['repliedMessage'], "inquiry") || strpos($_SESSION['repliedMessage'], "first-time") || strpos($_SESSION['repliedMessage'], "type")){
                echo "<p>Don't know where to start? Try</p>";
                echo "<button class='btn btn-secondary' name='btnTrack'>Track Documents</button>";
                echo " <a href='queue.php#getQueue' target='_blank'> <button class='btn btn-secondary' name='btnGetTicket'>Open a ticket</button></a>";
                echo " <button class='btn btn-secondary' name='btnClassSchedule'>View classroom schedules</button>";
            }
        ?>
        <br><br>
        <div class="row">
            <div class="col-sm-9">
                <input type="text" id="query" name="query" class="form-control" placeholder="Send a message..."<?php echo $style;?>>
            </div>
            <div class="col-sm-3">
                <button class="btn text-white" style="background-color: #6D0000;" name="send"<?php echo $style;?>>Send message</button>
            </div>
        </div>
    </form>
</div>
<br><br><br><br><br>

        <!-- FOOTER -->
        <div class="container-fluid header">
            <div class="text-center text-white" style="font-size: 11px;">
                IICS Help Desk © 2019
            </div>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../../js/jquery-3.3.1.js" ></script>
        <script>window.jQuery || document.write('<script src="../../js/jquery-3.3.1.js"><\/script>')</script>
        <script src="../../js/popper.js"></script>
        <script src="../../js/bootstrap.min.js"></script>

        <!-- Icons -->
        <script src="../../js/feather.min.js"></script>
        <script>
            feather.replace()
        </script>
        <!-- Graphs -->
		<script>
            $(document).ready(function () {

                function load_unseen_notification(view = '')
                {
                    $.ajax({
                        url: "../../include/fetch2.php",
                        method: "POST",
                        data: {view: view},
                        dataType: "json",
                        success: function (data)
                        {
                            $('.shownotif').html(data.notification);
                            if (data.unseen_notification > 0)
                            {
                                $('.count').html(data.unseen_notification);
                            }
                        }
                    });
                }

                load_unseen_notification();

                $(document).on('click', '.notif-toggle', function () {
                    $('.count').html('');
                    load_unseen_notification('yes');
                });

                setInterval(function () {
                    load_unseen_notification();
                    ;
                }, 1000);

            });
        </script>
    </body>
</html>