<?php
include '../../include/controller.php';

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

if (isset($_GET['queue'])) {
    $queue = $_GET['queue'];
} else {
    $queue = '';
}

if (isset($_POST['getQueueNum'])) {

    $docTitle = $_POST['docTitle'];
    $qno = $_POST['qno'];
    $qType = $_POST["selectType"];
    $qDesc = $_POST['qDesc'];
    $qDesc2 = $_POST['qDesc2'];
    $userno = $_SESSION['userno'];
    $qStatus = "Waiting";
    $inqueue = "1";

    if ($docTitle == "") {

        $submitSql = $conn->prepare("INSERT INTO queue VALUES ('', ?, ?, ?, ?, NOW(), ?)");
        $submitSql->bind_param("issss", $_SESSION['userno'], $qType, $docTitle, $qDesc, $qStatus);

        $submitSql2 = $conn->prepare("INSERT INTO queuelogs VALUES ('', ?, ?, ?, ?, '', NOW(), ?)");
        $submitSql2->bind_param("issss", $_SESSION['userno'], $qType, $docTitle, $qDesc, $qStatus);

        $userQ = $conn->prepare("UPDATE users SET inqueue=? WHERE userno=?");
        $userQ->bind_param("ii", $inqueue, $_SESSION['userno']);


        if ($submitSql == TRUE) {

            $submitSql->execute();
            $submitSql->close();

            if ($submitSql2 == TRUE) {
                $submitSql2->execute();
                $submitSql2->close();
            }

            if ($userQ == TRUE) {
                $userQ->execute();
                $userQ->close();
            }

            $qnologs = ++$qno;

            $passval = 'Queue Ticket No. ' . $qnologs . ' / ' . $qType . '';

            $passaction = "Get Queue Ticket";
            $logpass = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
            $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
            $logpass->execute();
            $logpass->close();

            $notiftitle = "New Queue Ticket";
            $notifdesc = "A New Queue Ticket has been added to the Waiting list.";
            $notifaudience = "admin";

            $notif = $conn->prepare("INSERT INTO notif VALUES ('',?,?,?,?,NOW(),0)");
            $notif->bind_param("isss", $_SESSION['userno'], $notiftitle, $notifdesc, $notifaudience);
            $notif->execute();
            $notif->close();

            header("Location: queue.php");
            exit;
        } else {
            $postFailed = '<div class="alert alert-danger">
                        Queue Failed!
                        </div>';
        }
    } elseif ($docTitle != "") {

        $submitSql = $conn->prepare("INSERT INTO queue VALUES ('', ?, ?, ?, ?, NOW(), ?)");
        $submitSql->bind_param("issss", $_SESSION['userno'], $qType, $docTitle, $qDesc2, $qStatus);

        $submitSql2 = $conn->prepare("INSERT INTO queuelogs VALUES ('', ?, ?, ?, ?, '', NOW(), ?)");
        $submitSql2->bind_param("issss", $_SESSION['userno'], $qType, $docTitle, $qDesc2, $qStatus);

        $userQ = $conn->prepare("UPDATE users SET inqueue=? WHERE userno=?");
        $userQ->bind_param("ii", $inqueue, $_SESSION['userno']);


        if ($submitSql == TRUE) {

            $submitSql->execute();
            $submitSql->close();

            if ($submitSql2 == TRUE) {
                $submitSql2->execute();
                $submitSql2->close();
            }

            if ($userQ == TRUE) {
                $userQ->execute();
                $userQ->close();
            }

            $qnologs = ++$qno;

            $passval = 'Queue Ticket No. ' . $qnologs . ' / ' . $qType . '';

            $passaction = "Get Queue Ticket";
            $logpass = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
            $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
            $logpass->execute();
            $logpass->close();

            $notiftitle = "New Queue Ticket";
            $notifdesc = "A New Queue Ticket has been added to the Waiting list.";
            $notifaudience = "admin";

            $notif = $conn->prepare("INSERT INTO notif VALUES ('',?,?,?,?,NOW(),0)");
            $notif->bind_param("isss", $_SESSION['userno'], $notiftitle, $notifdesc, $notifaudience);
            $notif->execute();
            $notif->close();

            header("Location: queue.php");
            exit;
        } else {
            $postFailed = '<div class="alert alert-danger">
                        Queue Failed!
                        </div>';
        }
    } else {
        $postFailed = '<div class="alert alert-danger">
                        Queue Failed!
                        </div>';
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

        <style>
            .bg-orange{
                background-color: #da5913;
            }
        </style>
    </head>

    <body>

        <!--NEW NAVBAR-->

        <?php 
        include '../../navbar.php';
    ?>

        <div class="container-fluid">


            <main role="main" class="col-md-12 ml-sm-auto">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Queue</h1>
                </div>

                <?php
                if ($queue == TRUE) {
                    echo '<div class="alert alert-danger"><span class="fas fa-check"></span> Queue failed! Transaction type cannot be empty.</div>';
                } else {
                    echo '';
                }
                ?>

                <?php
                $qcToggle = mysqli_query($conn, "SELECT * FROM qtoggle WHERE qtogno = '1'");

                if ($qcToggle->num_rows > 0) {
                    while ($row = $qcToggle->fetch_assoc()) {
                        $qtoggle = $row['qtoggle'];
                        $qadmin = $row['qadmin'];

                        if ($qtoggle == '0') {
                            echo

                            '<div class="card">'
                            . '<div class="card-header bg-dark text-white">'
                            . '<h5>Status: Closed '
                            . '</h5> '
                            . '</div> '
                            . '</div>'
                            . '<br>';
                        } else {

                            echo '<div class="card">'
                            . '<div class="card-header bg-success text-white">'
                            . '<h5>Status: Open '
                            . '</h5> '
                            . '</div> '
                            . '</div>'
                            . '<br>';

                            $qCheck = mysqli_query($conn, "SELECT *, LPAD(queue.qno,4,0) FROM users LEFT JOIN queue ON users.userno = queue.userno WHERE users.userno = " . $_SESSION['userno'] . " ORDER BY queue.qno DESC LIMIT 1");

                            if ($qCheck->num_rows > 0) {
                                while ($row = $qCheck->fetch_assoc()) {
                                    $inqueue = $row['inqueue'];
                                    $qno = $row['LPAD(queue.qno,4,0)'];
                                    $qdate = $row['qdate'];
                                    $qdesc = $row['qdesc'];
                                    $qtype = $row['qtype'];


                                    if ($inqueue == '0') {
                                        echo '
                    <a href="#getQueue" data-toggle="modal">
                        <button class="btn btn-primary btn-block">
                            <h4 class="text-center my-3">Get Queue Ticket</h4>
                        </button>
                    </a>

                    <div id="getQueue" class="modal fade" role="dialog">

                        <div class="modal-dialog modal-lg">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">

                                    <h4 class="modal-title">Get Queue Ticket</h4>
                                </div>

                                <div class="modal-body">
                                    <form method="post" action="">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type = "hidden" name="qno" value="' . $qno . '">
                                                <div class="form-group">
                                                    <label for="title"><h5>Transaction Type: <span class="require">*</span></h5></label>
                                                    <select name="selectType" class="form-control" id="selectType" required>
                                                        <option value="" selected disabled>Select one:</option>
                                                        <option value="Document Inquiry">Document Inquiry</option>
                                                        <option value="Enrollment Concern">Enrollment Concern</option>';
                                        if ($qadmin == '1') {
                                            echo '<option value="Meeting with Admin">Meeting with Admin</option>';
                                        } else {
                                            echo '<option disabled>Meeting with Admin</option>';
                                        }
                                        echo '<option value="Other">Other</option>
                                                        <option value="Document Submission">Document Submission</option>
                                                    </select>
                                                </div>

                                                <div class="form-group" id="qDesc">
                                                    <label for="description"><h5>Description: *</h5></label>
                                                    <textarea rows="2" class="form-control" name="qDesc"></textarea>
                                                </div>
                                                
                                               <div class="form-group" id="qDesc2">
                                                    <label for="title"><h5>Document Type: *</h5></label>
                                                    <select name="docTitle" class="form-control">
                                                      <option value="" selected disabled>Select one: </option>
                                                      <option value="Petition Form">Petition Form</option>
                                                      <option value="Endorsement Letter">Endorsement Letter</option>
                                                      <option value="Cross-Enrollment Form">Cross-Enrollment Form</option>
                                                      <option value="Add/Drop Form">Add/Drop Form</option>
                                                      <option value="Others">Others</option>
                                                    </select>
                                                    <label for="description"><h5>Description: *</h5></label>
                                                    <textarea rows="2" class="form-control" name="qDesc2"></textarea>
                                                </div>

                                            </div>
                                        </div>
                                        <br>
                                        <div class="modal-footer">
                                            <button style="float: right;" type="button" class="btn btn-secondary btn-m" data-dismiss="modal"><span class="fas fa-times"></span> Cancel</button>
                                            <button style="float: right;" type="submit" name="getQueueNum" class="btn btn-success btn-m"><span class="fas fa-clipboard-check" ></span> Queue</button>

                                        </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>';
                                    } else {
                                        echo '<div class="card">'
                                        . '<div class="card-header">'
                                        . '<h4 class="text-center my-3">Your Queue Number</h4>'
                                        . '</div>'
                                        . '<div class="card-body">'
                                        . '<h2 class="text-center">' . $qno . '</h2>'
                                        . '<h6 class="text-center">' . $qdate . '</h6>'
                                        . '<hr>'
                                        . '<h6 class="text-center">Transaction Type: ' . $qtype . '</h6>';
                                        if ($qtype == 'Other') {
                                            echo '<h6 class="text-center">Description: ' . $qdesc . '</h6>'
                                            . '</div></div>';
                                        } else {
                                            echo '</div>'
                                            . '</div>';
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                ?>


                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">In Line</h1>
                </div>

                <?php
                $qcToggle = mysqli_query($conn, "SELECT * FROM qtoggle WHERE qtogno = '1'");

                if ($qcToggle->num_rows > 0) {
                    while ($row = $qcToggle->fetch_assoc()) {
                        $qtoggle = $row['qtoggle'];

                        if ($qtoggle == '0') {
                            echo '<div class="card">'
                            . '<div class="card-header bg-dark text-white">'
                            . '<h5>Status: Closed '
                            . '</h5> '
                            . '</div> '
                            . '</div>'
                            . '<br>';
                        } else {

                            echo '<div class="row text-center">
                                        <div class="col-lg-6">
                                            <div class="card flex-fill">
                                                <div class="card-header bg-info text-light rounded"><h5>Now Serving</h5></div>
                                                    <div class="card-body nowList">';

//                            $qWaiting = mysqli_query($conn, "SELECT LPAD(qno,4,0) FROM queue WHERE qstatus = 'Now' LIMIT 1");
//                            if ($qWaiting->num_rows > 0) {
//                                while ($row = $qWaiting->fetch_assoc()) {
//                                    $qno = $row['LPAD(qno,4,0)'];
//                                    echo '<center><h2>' . $qno . '</h2></center>';
//                                }
//                            } else {
//                                echo '<center><h4>Empty</h4></center>';
//                            }

                            echo '                  </div>
                                                </div>
                                                <br>
                                            </div>
                                <br>';

                            echo '    <div class="col-lg-2">
                                        <div class="card flex-fill">
                                            <div class="card-header bg-orange text-light rounded"><h5>Waiting</h5></div>
                                                <div class="card-body waitingList">';

//                            $qWaiting = mysqli_query($conn, "SELECT LPAD(qno,4,0) FROM queue WHERE qstatus = 'Waiting' LIMIT 5");
//                            if ($qWaiting->num_rows > 0) {
//                                while ($row = $qWaiting->fetch_assoc()) {
//                                    $qno = $row['LPAD(qno,4,0)'];
//                                    echo '<center><h4>' . $qno . '</h4></center><hr>';
//                                }
//                            } else {
//                                echo '<center><h4>Empty</h4></center>';
//                            }

                            echo '              </div>
                                            </div>
                                            <br>
                                        </div>
                                <br>';

                            echo '    <div class="col-lg-2">
                                        <div class="card flex-fill">
                                            <div class="card-header bg-dark text-light rounded"><h5>No-Show</h5></div>
                                                <div class="card-body nsList">';

//                            $qWaiting = mysqli_query($conn, "SELECT LPAD(qno,4,0) FROM queue WHERE qstatus = 'No-Show' ORDER BY qno DESC LIMIT 5");
//                            if ($qWaiting->num_rows > 0) {
//                                while ($row = $qWaiting->fetch_assoc()) {
//                                    $qno = $row['LPAD(qno,4,0)'];
//                                    echo '<center><h4>' . $qno . '</h4></center><hr>';
//                                }
//                            } else {
//                                echo '<center><h4>Empty</h4></center>';
//                            }

                            echo '              </div>
                                            </div>
                                            <br>
                                        </div>
                                    <br>';

                            echo '    <div class="col-lg-2">
                                        <div class="card flex-fill">
                                            <div class="card-header bg-success text-light rounded"><h5>Done</h5></div>
                                                <div class="card-body doneList">';

//                            $qWaiting = mysqli_query($conn, "SELECT LPAD(qno,4,0) FROM queue WHERE qstatus = 'Done' ORDER BY qno DESC LIMIT 5");
//                            if ($qWaiting->num_rows > 0) {
//                                while ($row = $qWaiting->fetch_assoc()) {
//                                    $qno = $row['LPAD(qno,4,0)'];
//                                    echo '<center><h4>' . $qno . '</h4></center><hr>';
//                                }
//                            } else {
//                                echo '<center><h4>Empty</h4></center>';
//                            }

                            echo '              </div>
                                            </div>
                                            <br>
                                        </div>
                                      </div>
                                    <br>
                            </div>';
                        }
                    }
                }
                ?>
                <br>

                <br>

                </div>
                <br><br><br>
            </main>

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

            <script>
                $("#qDesc").hide();
                $("#selectType").change(function () {
                    var val = $("#selectType").val();
                    if (val == "Other") {
                        $("#qDesc").show();
                    } else {
                        $("#qDesc").hide();
                    }
                });

                $("#qDesc2").hide();
                $("#selectType").change(function () {
                    var val = $("#selectType").val();
                    if (val == "Document Submission") {
                        $("#qDesc2").show();
                    } else {
                        $("#qDesc2").hide();
                    }
                });
            </script>

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

            <script>
                $(document).ready(function () {

                    function load_wait_list(waitingList = '')
                    {
                        $.ajax({
                            url: "../../include/fetch2.php",
                            method: "POST",
                            data: {waitingList: waitingList},
                            dataType: "json",
                            success: function (waitData)
                            {
                                $('.waitingList').html(waitData.waitingList);
                            }
                        });
                    }

                    load_wait_list('yes');

                    setInterval(function () {
                        load_wait_list();
                        ;
                    }, 1000);

                });
            </script>

            <script>
                $(document).ready(function () {

                    function load_now_list(nowList = '')
                    {
                        $.ajax({
                            url: "../../include/fetch2.php",
                            method: "POST",
                            data: {nowList: nowList},
                            dataType: "json",
                            success: function (nowData)
                            {
                                $('.nowList').html(nowData.nowList);
                            }
                        });
                    }

                    load_now_list('yes');

                    setInterval(function () {
                        load_now_list();
                        ;
                    }, 1000);

                });
            </script>

            <script>
                $(document).ready(function () {

                    function load_ns_list(nsList = '')
                    {
                        $.ajax({
                            url: "../../include/fetch2.php",
                            method: "POST",
                            data: {nsList: nsList},
                            dataType: "json",
                            success: function (nsData)
                            {
                                $('.nsList').html(nsData.nsList);
                            }
                        });
                    }

                    load_ns_list('yes');

                    setInterval(function () {
                        load_ns_list();
                        ;
                    }, 1000);

                });
            </script>

            <script>
                $(document).ready(function () {

                    function load_done_list(doneList = '')
                    {
                        $.ajax({
                            url: "../../include/fetch2.php",
                            method: "POST",
                            data: {doneList: doneList},
                            dataType: "json",
                            success: function (doneData)
                            {
                                $('.doneList').html(doneData.doneList);
                            }
                        });
                    }

                    load_done_list('yes');

                    setInterval(function () {
                        load_done_list();
                        ;
                    }, 1000);

                });
            </script>

    </body>
</html>
