
<?php
include '../../include/controller.php';

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
    header("location:/iicshd/index.php");
}

if (isset($_GET['clear'])) {
    $clear = $_GET['clear'];
} else {
    $clear = '';
}

if (isset($_GET['check'])) {
    $check = $_GET['check'];
} else {
    $check = '';
}

$passwordCheck = '';

if (isset($_POST['toggleClear'])) {
    $passwordCheck = $_POST['passwordCheck'];
    $check_userid = $_POST['check_userid'];

    $pcheck = $conn->prepare("SELECT * FROM users WHERE userid = ?");
    $pcheck->bind_param("s", $check_userid);
    $pcheck->execute();
    $result = $pcheck->get_result();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $hashedPwdCheck = password_verify($passwordCheck, $row['password']);

            if ($hashedPwdCheck == FALSE) {
                $_GET['check'] = 'failed';
                header("Location: cpanel3.php?check=failed");
            } elseif ($hashedPwdCheck == TRUE) {

                $clearQuery = $conn->prepare("TRUNCATE TABLE queue");
                $clearQuery->execute();
                $clearQuery->close();

                $_GET['clear'] = "success";
                header("location: cpanel3.php?clear=success");
                exit;
            }
        }
    } else {
        echo "Clear Queue failed.";
    }
}
?>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../img/favicon.png">

        <title>IICS Help Desk - Admin</title>

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


        <!-- DataTable-->
        <link rel="stylesheet" href="../../DataTables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="../../DataTables/Responsive-2.2.1/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="../../DataTables/Buttons-1.5.1/css/buttons.dataTables.min.css">

    </head>

    <body>

    <?php 
        include '../../navbar.php';
    ?>

        <div class="container">


            <main role="main" class="col-md-12 ml-sm-auto">

                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 mt-5">Control Panel</h1>
                </div>

                <?php
                if ($clear == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Queue cleared successfully!</div>';
                } else {
                    echo '';
                }

                if ($check == TRUE) {
                    echo '<div class="alert alert-danger"><span class="fas fa-times"></span> Clear queue failed.</div>';
                } else {
                    echo '';
                }
                ?>

                <div class="row">

                    <div class="col-sm-2">
                        <div class="card">
                            <ul class="list-group list-group-flush">
                                <a href="cpanel.php"><li class="list-group-item">General <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel2.php"><li class="list-group-item">User Accounts <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel3.php"><li class="list-group-item active">Queue Settings <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel4.php"><li class="list-group-item">Manage Uploads <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel5.php"><li class="list-group-item">Create Admin <span class="fas fa-caret-right float-right"></span></li></a>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-10">
                        <div class="card">
                            <h4 class="card-header">Queue Settings</h4>
                            <div class="card-body">

                                <h5 class="card-title">Clear Queue List</h5>
                                <hr>
                                <a href='#clear' data-toggle='modal'><button type='button' class='btn btn-dark' title='Clear Queue'><span class='fas fa-trash' aria-hidden='true'></span> Clear</button></a>

                                <div id="clear" class="modal fade" role="dialog">

                                    <div class="modal-dialog modal-lg">

                                        <form method="post">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <h4 class="modal-title">Clear Queue</h4>
                                                </div>

                                                <div class="modal-body">
                                                    <input type="hidden" name="check_userid" value="<?php echo $_SESSION['userid']; ?>">
                                                    <label for="inputPassword">Please input your password: </label>
                                                    <p><input type="password" id="inputPassword" class="form-control" placeholder="Password" name = "passwordCheck"></p>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> Cancel</button>
                                                        <button class="btn btn-dark" type = "submit" name="toggleClear" title="Clear Queue"><span class="fas fa-trash"></span> Clear</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </form>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>


                </div>
                <br><br><br>

            </main>

        </div>

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

        <!-- DataTable js -->
        <script src="../../DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
        <script src="../../DataTables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
        <script src="../../DataTables/Responsive-2.2.1/js/responsive.bootstrap4.min.js"></script>

        <!-- DatatableButtons -->
        <script src="../../DataTables/Buttons-1.5.1/js/dataTables.buttons.min.js"></script>
        <script src="../../DataTables/Buttons-1.5.1/js/buttons.bootstrap4.min.js"></script>
        <script src="../../DataTables/Buttons-1.5.1/js/buttons.flash.min.js"></script>
        <script src="../../DataTables/JSZip-2.5.0/jszip.min.js"></script>
        <script src="../../DataTables/pdfmake-0.1.32/pdfmake.min.js"></script>
        <script src="../../DataTables/pdfmake-0.1.32/vfs_fonts.js"></script>
        <script src="../../DataTables/Buttons-1.5.1/js/buttons.html5.min.js"></script>
        <script src="../../DataTables/Buttons-1.5.1/js/buttons.print.min.js"></script>
        <!-- Icons -->
        <script src="../../js/feather.min.js"></script>
        <script>
            feather.replace()
        </script>

        <script>
            $(document).ready(function () {
<?php
$thisDate = date("m/d/Y");
?>

                $('#myannouncements').DataTable({
                    "bLengthChange": false,
                    pageLength: 5,
                    initComplete: function () {
                        this.api().columns().every(function () {
                            var column = this;
                            var select = $('<select><option value="">Show all</option></select>')
                                    .appendTo($(column.footer()).empty())
                                    .on('change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                                $(this).val()
                                                );

                                        column
                                                .search(val ? '^' + val + '$' : '', true, false)
                                                .draw();
                                    });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    }



                });
            });

        </script>

        <script>
            $('.collapse').on('shown.bs.collapse', function () {
                $(this).parent().find(".fa-plus-circle").removeClass("fa-plus-circle").addClass("fa-minus-circle");
            }).on('hidden.bs.collapse', function () {
                $(this).parent().find(".fa-minus-circle").removeClass("fa-minus-circle").addClass("fa-plus-circle");
            });
        </script>

        <script>
            $(document).ready(function () {

                function load_unseen_notification(view = '')
                {
                    $.ajax({
                        url: "../../include/fetch1.php",
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
