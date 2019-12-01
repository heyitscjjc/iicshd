<?php
include '../../include/controller.php';

if (isset($_SESSION['user_name']) && $_SESSION['role'] == "admin") {
    header("location:/iicshd/user/admin/home.php");
}
if (isset($_SESSION['user_name']) && $_SESSION['role'] == "faculty") {
    header("location:/iicshd/user/faculty/home.php");
}
if (isset($_SESSION['user_name']) && $_SESSION['role'] == "organizati") {
    header("location:/iicshd/user/organization/home.php");
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

if (isset($_GET['pin'])) {
    $pin = $_GET['pin'];
} else {
    $pin = '';
}
if (isset($_GET['unpin'])) {
    $unpin = $_GET['unpin'];
} else {
    $unpin = '';
}


if (isset($_POST['pinPost'])) {
    $annno = $_POST['pin_annno'];

    $editquery = $conn->prepare("UPDATE announcements SET pin='1' WHERE annno=?");
    $editquery->bind_param("i", $annno);
    $editquery->execute();
    $editquery->close();

    if ($editquery == TRUE) {

        header("location: home.php?pin=success");
        exit;
    } else {
        echo "Pin failed.";
    }
}

if (isset($_POST['unpinPost'])) {
    $annno = $_POST['unpin_annno'];

    $editquery = $conn->prepare("UPDATE announcements SET pin='0' WHERE annno=?");
    $editquery->bind_param("i", $annno);
    $editquery->execute();
    $editquery->close();

    if ($editquery == TRUE) {

        header("location: home.php?unpin=success");
        exit;
    } else {
        echo "Unpin failed.";
    }
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
        </style>

        <!-- Font Awesome JS -->
        <script defer src="../../fa-5.5.0/js/solid.js"></script>
        <script defer src="../../fa-5.5.0/js/fontawesome.js"></script>
    </head>

    <body>
    
    <?php 
        include '../../navbar.php';
        echo "<p style='background-color: #f1c40f; padding: 10px;'>NEW: Type in your inquiry and let it answered by the assistant helper. Check it now by clicking on the 'Ask me Anything' in the navigation bar.</p>"
    ?>

        <div class="container-fluid">
        <iframe src="https://assistant-chat-us-south.watsonplatform.net/web/public/67b3c7f3-1c99-487b-99a3-53e98923c8b2"></iframe>
        </div>

        <div class="container-fluid header">
            <div align="center" style="font-size: 11px; color:white;">
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
