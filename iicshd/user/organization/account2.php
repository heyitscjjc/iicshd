<?php
include '../../include/controller.php';

if (isset($_SESSION['user_name']) && $_SESSION['role'] == "admin") {
    header("location:/iicshd/user/admin/home.php");
}
if (isset($_SESSION['user_name']) && $_SESSION['role'] == "faculty") {
    header("location:/iicshd/user/faculty/home.php");
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

$oldPassErr = $confirmErr = $passwordErr = "";

if (isset($_GET['status'])) {
    $changePw = $_GET['status'];
} else {
    $changePw = '';
}

if (isset($_POST['updatePass'])) {
    $oldPass = $_POST['oldPass'];
    $newPass = $_POST['newPass'];
    $confirm = $_POST['confirmPass'];
    $edit_pno = $_POST['edit_pno'];

    $updateBool = TRUE;

    $sql = "SELECT * FROM users WHERE userno = '{$_SESSION['userno']}'";
    $result = mysqli_query($conn, $sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $hashedOldPwdCheck = password_verify($oldPass, $row['password']);


            if ($hashedOldPwdCheck == FALSE) {
                $oldPassErr = '<div class="alert alert-warning">
                        Wrong password.
                        </div>';
            } elseif ($hashedOldPwdCheck == TRUE) {

                if ($newPass != $confirm) {
                    $confirmErr = '<div class="alert alert-warning">
                        Password does not match the confirm password.
                        </div>';
                    $updateBool = FALSE;
                }

                if (!preg_match("/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/", $newPass)) {
                    $passwordErr = '<div class="alert alert-warning">
                        Password must be atleast 8 characters long and must be a combination of uppercase letters, lowercase letters and numbers.
                        </div>';

                    $updateBool = FALSE;
                }

                if ($updateBool == TRUE) {
                    $hashedPwd = password_hash($newPass, PASSWORD_DEFAULT);
                    if ($stmt = $conn->prepare("UPDATE users SET PASSWORD =? WHERE USERNO= ? ")) {

                        $stmt->bind_param("si", $hashedPwd, $edit_pno);
                        $stmt->execute();
                        $stmt->close();


                        $passval = 'Password changed.';

                        $passaction = "Change Password";
                        $logpass = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
                        $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
                        $logpass->execute();
                        $logpass->close();

                        $_GET['status'] = 'success';

                        header("Location: account2.php?status=success");
                    }
                }
            }
        }
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
    ?>

        <div class="container-fluid">

            <main role="main" class="col-md-12 ml-sm-auto">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Account Details</h1>
                </div>
                <?php
                if ($changePw == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Password changed successfully!</div>';
                } else {
                    echo '';
                }
                ?>

                <div class="row">

                    <div class="col-sm-2">
                        <div class="card">
                            <ul class="list-group list-group-flush">
                                <a href="account.php"><li class="list-group-item">User Information <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account2.php"><li class="list-group-item active">Security <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account4.php"><li class="list-group-item">Consultation Hours <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account3.php"><li class="list-group-item">Activity Logs <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                            </ul>
                        </div>
                    </div>


                    <div class='col-sm-10'>

                        <div class="card">
                            <div class="card-header">
                                <h5>
                                    <span class="fas fa-lock"></span>
                                    Security
                                </h5>
                            </div>

                            <form action="" method="POST">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h5>Change Password</h5>
                                    </div>
                                    <input type="hidden" name="edit_pno" value="<?php echo $_SESSION['userno']; ?>">
                                    <hr>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><h6><label for="oldpw">Current Password: &nbsp;</label></h6></td>
                                                <td><input type="password" class="form-control" id="oldPw" required name="oldPass"><?php echo $oldPassErr; ?><br></td>
                                            </tr>
                                            <tr>
                                                <td><h6><label for="newPw">New Password: &nbsp;</label></h6></td>
                                                <td><input type="password" class="form-control" required id="newPw" name="newPass"><?php echo $passwordErr; ?><br></td>
                                            </tr>
                                            <tr>
                                                <td><h6><label for="confnewpass">Confirm New Password: &nbsp;</label></h6></td>
                                                <td><input type="password" class="form-control" required id="confirmNew" name="confirmPass"><?php echo $confirmErr; ?><br></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="btn-div">
                                        <button type="submit" name = "updatePass" class="btn btn-success float-right">Update</button><br>
                                    </div>
                                    <br>
                                </div>
                            </form>

                        </div>
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

        <!-- Icons -->
        <script src="../../js/feather.min.js"></script>
        <script>
            feather.replace()
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
