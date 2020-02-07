<?php
include '../../include/controller.php';
$_SESSION['previousMessages'] = array();
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

$studdept = $_SESSION['dept'];

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


            <main role="main" class="col-md-12 ml-sm-auto">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Home</h1>
                </div>

                <?php
                if ($pin == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Pin successful!</div>';
                } else {
                    echo '';
                }

                if ($unpin == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Unpin successful!</div>';
                } else {
                    echo '';
                }
                ?>


                <div class="accordion" id="accordionExample">

                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn bg-dark text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    <span class="fas fa-plus-circle"></span> Pinned Announcements
                                </button>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="card-body">
                                <?php
                                $announcePin = "SELECT announcements.annno, announcements.anntitle, announcements.anndesc, announcements.anndate, announcements.userno, users.fname, users.mname, users.lname FROM announcements LEFT JOIN users ON users.userno = announcements.userno WHERE announcements.hidden = '0' AND announcements.pin = '1' ORDER BY announcements.annno DESC";
                                $result2 = $conn->query($announcePin);

                                if ($result2->num_rows > 0) {
                                    while ($row = $result2->fetch_assoc()) {
                                        $annno = $row['annno'];
                                        $anntitle = $row['anntitle'];
                                        $anndesc = $row['anndesc'];
                                        $anndate = $row['anndate'];
                                        $usercreated = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);

                                        echo '<div class="card">
                                        <div class="card-header text-white">
                                            <a href="#bookm' . $annno . '" data-toggle="modal"><button type="button" class="btn btn-dark btn-sm" style="float:right;" title="Unpin Announcement"><i class="fas fa-thumbtack"></i></button></a>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">' . $anntitle . '</h5>
                                            <p class="card-text" style="font-size: 12px;">Posted on ' . date("m/d/Y h:iA", strtotime($anndate)) . ' by ' . $usercreated . '</p>
                                            <p class="card-text" style="font-size: 15px;">' . $anndesc . '</p>
                                        </div>
                                  </div><br>';
                                        echo
                                        '<div id="bookm' . $annno . '" class="modal fade" role="dialog">
                                                            <form method="post">
                                                                <div class="modal-dialog modal-lg">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">

                                                                            <h4 class="modal-title">Unpin Annoucement</h4>
                                                                        </div>

                                                                        <div class="modal-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <input type="hidden" name="unpin_annno" value="' . $annno . '">
                                                                                    <h6>Are you sure you want to unpin this announcement?</h6>
                                                                                    <div class="card">
                                                                                        <div class="card-header bg-light text-white">

                                                                                        </div>
                                                                                        <div class="card-body bg-light">
                                                                                            <h5 class="card-title">' . $anntitle . '</h5>
                                                                                            <p class="card-text" style="font-size: 12px;">Posted on ' . date("m/d/Y h:iA", strtotime($anndate)) . ' by ' . $usercreated . '</p>
                                                                                            <p class="card-text" style="font-size: 15px;">' . $anndesc . '</p>
                                                                                        </div>
                                                                                  </div>
                                                                                </div>
                                                                            </div>
                                                                            <br>
                                                                            <div class="modal-footer">
                                                                                <button style="float: right;" type="button" class="btn btn-secondary btn-m" data-dismiss="modal"><span class="fas fa-times"></span> Cancel</button>
                                                                                <button style="float: right;" type="submit" name="unpinPost" class="btn btn-success btn-m"><span class="fas fa-clipboard-check" ></span> Unpin</button>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>';
                                    }
                                } else {
                                    echo "<h5>You haven't pinned any announcements yet. Click the <i class='fas fa-thumbtack'></i> button to pin an announcement.</h5>";
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>

                <br>


                <?php
                $announceSelect = "SELECT announcements.annno, announcements.anntitle, announcements.anndesc, announcements.anndate, announcements.userno, users.fname, users.mname, users.lname FROM announcements LEFT JOIN users ON users.userno = announcements.userno WHERE announcements.deptno = '". $studdept ."' OR announcements.deptno = '0' ORDER BY announcements.annno DESC";
                $result = $conn->query($announceSelect);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $annno = $row['annno'];
                        $anntitle = $row['anntitle'];
                        $anndesc = $row['anndesc'];
                        $anndate = $row['anndate'];
                        $usercreated = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);

                        echo '<div class="card">
                                        <div class="card-header bg-dark text-white">
                                            <a href="#book' . $annno . '" data-toggle="modal"><button type="button" class="btn btn-light btn-sm" style="float:right;" title="Pin Announcement"><i class="fas fa-thumbtack"></i></button></a>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">' . $anntitle . '</h5>
                                            <p class="card-text" style="font-size: 12px;">Posted on ' . date("m/d/Y h:iA", strtotime($anndate)) . ' by ' . $usercreated . '</p>
                                            <p class="card-text" style="font-size: 15px;">' . $anndesc . '</p>
                                        </div>
                                  </div><br>';
                        echo
                        '<div id="book' . $annno . '" class="modal fade" role="dialog">
                                                            <form method="post">
                                                                <div class="modal-dialog modal-lg">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">

                                                                            <h4 class="modal-title">Pin Annoucement</h4>
                                                                        </div>

                                                                        <div class="modal-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <input type="hidden" name="pin_annno" value="' . $annno . '">
                                                                                    <h6>Are you sure you want to pin this announcement?</h6>
                                                                                    <div class="card">
                                                                                        <div class="card-header bg-light text-white">

                                                                                        </div>
                                                                                        <div class="card-body bg-light">
                                                                                            <h5 class="card-title">' . $anntitle . '</h5>
                                                                                            <p class="card-text" style="font-size: 12px;">Posted on ' . date("m/d/Y h:iA", strtotime($anndate)) . ' by ' . $usercreated . '</p>
                                                                                            <p class="card-text" style="font-size: 15px;">' . $anndesc . '</p>
                                                                                        </div>
                                                                                  </div>
                                                                                </div>
                                                                            </div>
                                                                            <br>
                                                                            <div class="modal-footer">
                                                                                <button style="float: right;" type="button" class="btn btn-secondary btn-m" data-dismiss="modal"><span class="fas fa-times"></span> Cancel</button>
                                                                                <button style="float: right;" type="submit" name="pinPost" class="btn btn-success btn-m"><span class="fas fa-thumbtack" ></span> Pin</button>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>';
                    }
                } else {
                    echo "<h5>There are no announcements yet.</h5>";
                }
                ?>

                <br><br><br>


            </main>
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
