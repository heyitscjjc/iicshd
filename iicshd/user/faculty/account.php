<?php
include '../../include/controller.php';

if (isset($_SESSION['user_name']) && $_SESSION['role'] == "admin") {
    header("location:/iicshd/user/admin/home.php");
}
if (isset($_SESSION['user_name']) && $_SESSION['role'] == "student") {
    header("location:/iicshd/user/student/home.php");
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

if (isset($_POST['insertsched'])) {
    $consulday = $_POST['consulday'];
    $consulstart = $_POST['consulstart'];
    $consulend = $_POST['consulend'];

    $c = $consulday . " " . $consulstart . "-" . $consulend;

    $submitSql = $conn->prepare("INSERT INTO consulthours VALUES ('', ?, 1, ?)");
    $submitSql->bind_param("ss", $_SESSION['userno'], $c);
    $submitSql->execute();
    $submitSql->close();
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
        <link href="../../css/bootstrap-timepicker.min.css" rel="stylesheet"/>

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
        <!--NEW NAVBAR-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand">
                <img src = "../../img/logosolo.png"></img>       
                <span class="mb-0 h6" style="color:white;">IICS Help Desk</span> 
            </a>


            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="home.php">
                            <span data-feather="home"></span>
                            Home <span class="sr-only">(current)</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="consultations.php">
                            <span data-feather="file-text"></span>
                            Consultation
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="color:white;" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <span data-feather="calendar"></span>
                            Schedule
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="fschedule.php">
                                <span data-feather="book-open"></span>
                                Faculty Schedule
                            </a>
                            <a class="dropdown-item" href="cschedule.php">
                                <span data-feather="book-open"></span>
                                Class Schedule
                            </a>
                            <a class="dropdown-item" href="rschedule.php">
                                <span data-feather="book-open"></span>
                                Room Schedule
                            </a>
							<a class="dropdown-item" href="eschedule.php">
                                <span data-feather="book-open"></span>
                                Exam Schedule
                            </a>
                        </div>
                    </li>
                </ul>

                <ul class="navbar-nav px-1">
                    <li class="dropdown">
                        <a href="#" class="btn btn-primary btn-sm dropdown-toggle notif-toggle" data-toggle="dropdown"><span class="badge badge-danger count" style="border-radius:10px;"></span> <span class="fas fa-bell" style="font-size:18px;"></span> Notifications</a>
                        <ul class="shownotif dropdown-menu" style="white-space:normal;"></ul>
                    </li>
                </ul>

                <!--                <ul class="navbar-nav px-1">
                                    <li class="nav-item text-nowrap">
                                    <li class="nav-item dropdown">
                                        <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="fas fa-envelope"></span>
                                            Notifications
                                        </button>
                                        <div class="dropdown-menu" style="white-space: normal;">
                <?php
//                            $notifquery = "SELECT notif.notifno, notif.notiftitle, notif.notifdesc, notif.notifaudience, notif.notifdate, users.userno 
//                                                    FROM notif 
//                                                INNER JOIN users 
//                                                ON users.userno = notif.notifaudience 
//                                                WHERE notif.notifaudience = '" . $_SESSION['userno'] . "' 
//                                                UNION ALL 
//                                            SELECT notif.notifno, notif.notiftitle, notif.notifdesc, notif.notifaudience, notif.notifdate, notif.notifno as userno 
//                                                    FROM notif 
//                                                WHERE notif.notifaudience = 'all' 
//                                                UNION ALL
//                                            SELECT notif.notifno, notif.notiftitle, notif.notifdesc, notif.notifaudience, notif.notifdate, notif.notifno as userno 
//                                                    FROM notif 
//                                                    WHERE notif.notifaudience = 'faculty' 
//                                            ORDER BY notifno DESC LIMIT 4";
//                            $notifresult = $conn->query($notifquery);
//
//                            if ($notifresult->num_rows > 0) {
//                                while ($row = $notifresult->fetch_assoc()) {
//                                    $notiftitle = $row['notiftitle'];
//                                    $notifdesc = $row['notifdesc'];
//                                    $notifdate = $row['notifdate'];
//
//                                    echo '
//                                            <a class="dropdown-item" ';
//
//                                    if ($notiftitle == "New Announcement Posted") {
//                                        echo 'href="home.php"';
//                                    }
//                                    if ($notiftitle == "Consultation Request") {
//                                        echo 'href="consultations.php"';
//                                    }
//                                    if ($notiftitle == "Schedule Updated") {
//                                        echo 'href="fschedule.php"';
//                                    }
//                                    echo 'style="width: 300px; white-space: normal;">
//                                                <span style="font-size: 13px;"><strong> ' . $notiftitle . ' </strong></span><br>
//                                                ' . $notifdesc . ' <br>
//                                                <span style="font-size: 10px;"> ' . $notifdate . ' </span><br>
//                                            </a>
//                                            <div class="dropdown-divider"></div>';
//                                }
//                            } else {
//                                echo '
//                                            <a class="dropdown-item" href="#" style="width: 300px; white-space: normal;">
//                                                No new notifications.
//                                            </a>';
//                            }
                ?>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="notifications.php" style="color: blue; width: 300px; white-space: normal;">
                                                <center>View All Notifications</center>
                                            </a>
                                        </div>
                                    </li>
                                    </li>
                                </ul>-->

                <ul class="navbar-nav px-3">
                    <li class="nav-item text-nowrap">
                    <li class="nav-item dropdown">
                        <button type="button" class="btn btn-dark btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span data-feather="user"></span>
                            <?php
                            echo $_SESSION['user_name'];
                            ?>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item active" href="account.php">
                                <i class="fas fa-user-cog"></i>
                                Account
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="../../logout.php">
                                <span data-feather="log-out"></span>  Log Out
                            </a>
                        </div>
                    </li>
                    </li>
                </ul>
            </div>
        </nav>


        <div class="container-fluid">

            <main role="main" class="col-md-12 ml-sm-auto">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Account Details</h1>
                </div>

                <div class="row">

                    <div class="col-sm-2">
                        <div class="card">
                            <ul class="list-group list-group-flush">
                                <a href="account.php"><li class="list-group-item active">User Information <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account2.php"><li class="list-group-item">Security <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account4.php"><li class="list-group-item">Consultation Hours <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account3.php"><li class="list-group-item">Activity Logs <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                            </ul>
                        </div>
                    </div>


                    <div class='col-sm-10'>
                        <div class="card">
                            <div class="card-header">
                                <h5>
                                    <span class="fas fa-user"></span>
                                    User Information
                                </h5>
                            </div>
                            <form action="" method="post">
                                <div class="card-body">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><h6><label for="id">User ID: &nbsp;</label></h6></td>
                                                <td><input class="form-control" type="text" name="userid" disabled placeholder="<?php echo $_SESSION['userid']; ?>"><br></td>
                                            </tr>
                                            <tr>
                                                <td><h6><label for="name">Name: &nbsp;</label></h6></td>
                                                <td><input class="form-control" type="text" name="name" disabled placeholder="<?php echo $_SESSION['user_name']; ?>"><br></td>
                                            </tr>
                                            <tr>
                                                <td><h6><label for="email">Email: &nbsp;</label></h6></td>
                                                <td><input class="form-control" type="text" name="email" disabled placeholder="<?php echo $_SESSION['email']; ?>"><br></td>
                                            </tr>
                                            <tr>
                                                <td><h6><label for="consul">Consultation Hours: &nbsp;</label></h6></td>
                                        <div class="alert alert-warning">Click <a href="account4.php">here</a> to manage consultation hours. </div><td>
                                            <?php
                                            $prof = mysqli_query($conn, "SELECT * FROM consulthours WHERE userno = '" . $_SESSION['userno'] . "'");

                                            if ($prof->num_rows > 0) {
                                                while ($row = $prof->fetch_assoc()) {
                                                    $consulhours = $row['daytime'];

                                                    echo '<input class="form-control" type="text" size="30" name="email" placeholder="' . $consulhours . '" disabled>';
                                                }
                                            } else {
                                                echo ''
                                                . '<div class="card">
                                                    <div class="alert alert-warning">Please set consultation hours.</div>
                                                    <div class="card-header"><h7>Select Day: </h7></div>
                                                    <div class="card-body"><select name="consulday" class="form-control" required>
                                                      <option value="" selected disabled>Choose one: </option>
                                                      <option value="Monday">Monday</option>
                                                      <option value="Tuesday">Tuesday</option>
                                                      <option value="Wednesday">Wednesday</option>
                                                      <option value="Thursday">Thursday</option>
                                                      <option value="Friday">Friday</option>
                                                      <option value="Saturday">Saturday</option>
                                                    </select></div><br>
                                                    <div class="card-footer card-header"><h7>Select Time (AM/PM): </h7></div>'
                                                . '<div class="card-body">Start: <div class="input-group bootstrap-timepicker timepicker">
                                                                                        <input id="timepicker1" type="text" name="consulstart" class="form-control" required>
                                                                                        <span class="input-group-addon"><i class="fas fa-clock"></i></span>
                                                                                    </div><br>'
                                                . 'End: <div class="input-group bootstrap-timepicker timepicker">
                                                                                        <input id="timepicker2" type="text" name="consulend" class="form-control" required>
                                                                                        <span class="input-group-addon"><i class="fas fa-clock"></i></span>
                                                                                    </div>'
                                                . '     <div class="card-footer">
                                                            <button type="submit" name = "insertsched" class="btn btn-success">Update</button><br>
                                                        </div>'
                                                . '</div>';
                                            }
                                            ?>
                                        </td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </form>
                            <br>

                        </div>

                        <br>

                    </div>
                </div>

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
        <script type="text/javascript" src="../../js/bootstrap-timepicker.min.js"></script>

        <!-- Icons -->
        <script src="../../js/feather.min.js"></script>
        <script>
            feather.replace()
        </script>

        <script type="text/javascript">
            $('#timepicker1').timepicker({
                explicitMode: true,
                defaultTime: false,
                showInputs: true
            });

            $('#timepicker2').timepicker({
                explicitMode: true,
                defaultTime: false,
                showInputs: true
            });
        </script>

        <!-- Graphs -->
        <script src="../../js/Chart.min.js"></script>
        <script>
            var ctx = document.getElementById("myChart");
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                    datasets: [{
                            data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
                            lineTension: 0,
                            backgroundColor: 'transparent',
                            borderColor: '#007bff',
                            borderWidth: 4,
                            pointBackgroundColor: '#007bff'
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: false
                                }
                            }]
                    },
                    legend: {
                        display: false,
                    }
                }
            });
        </script>

        <script>
            $(document).ready(function () {

                function load_unseen_notification(view = '')
                {
                    $.ajax({
                        url: "../../include/fetch3.php",
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
