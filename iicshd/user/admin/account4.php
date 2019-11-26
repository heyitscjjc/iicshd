
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
    header("location:/iicshd/login.php");
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

        <title>IICS Help Desk - Admin</title>

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

            td{
                text-align:left;
            }
        </style>


        <!-- Font Awesome JS -->
        <script defer src="../../fa-5.5.0/js/solid.js"></script>
        <script defer src="../../fa-5.5.0/js/fontawesome.js"></script>

        <!-- DataTable-->
        <link rel="stylesheet" href="../../DataTables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="../../DataTables/Responsive-2.2.1/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="../../DataTables/Buttons-1.5.1/css/buttons.dataTables.min.css">
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

                <div class="row">

                    <div class="col-sm-2">
                        <div class="card">
                            <ul class="list-group list-group-flush">
                                <a href="account.php"><li class="list-group-item">User Information <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account2.php"><li class="list-group-item">Security <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account3.php"><li class="list-group-item">Activity Logs <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                                <a href="account4.php"><li class="list-group-item active">Archives <span style="float:right;" class="fas fa-caret-right"></span></li></a>
                            </ul>
                        </div>
                    </div>


                    <div class='col-sm-10'>
                        <div class="card">
                            <div class="card-header">
                                <h5>
                                    <span class="fas fa-user"></span>
                                    Archived Posts
                                </h5>
                            </div>

                            <div class="card-body">

                                <table id="data_table" class="table table-striped table-responsive-lg">

                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Announcement Title</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <?php
                                        $exelogs = mysqli_query($conn, "SELECT * FROM announcements WHERE userno = '" . $_SESSION['userno'] . "' AND HIDDEN = '1'");

                                        if ($exelogs->num_rows > 0) {
                                            while ($row = $exelogs->fetch_assoc()) {
                                                $anntitle = $row['anntitle'];
                                                $anndesc = $row['anndesc'];
                                                $anndate = $row['anndate'];

                                                echo "<tr>"
                                                . "<td>" . date("m/d/Y h:iA", strtotime($anndate)) . "</td>"
                                                . "<td>" . $anntitle . "</td>"
                                                . "<td>" . $anndesc . "</td>";
                                            }
                                        }
                                        ?>  

                                    </tbody>

                                    <tfoot>
                                        <tr>
                                            <th>Date</th>
                                            <th>Announcement Title</th>
                                            <th>Description</th>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>

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

        <script>
            $(document).ready(function () {
<?php
$thisDate = date("m/d/Y");
?>

                $('#data_table').DataTable({
                    "bLengthChange": true,

                    dom: 'lBfrtip',
                    buttons: [
                        {extend: 'copy', className: 'btn btn-secondary', text: '<i class="fas fa-copy"></i>', titleAttr: 'Copy', title: 'Report Generated by: <?php echo $_SESSION['user_name'] . " on " . $thisDate; ?>'},
                        {extend: 'csv', className: 'btn bg-primary', text: '<i class="fas fa-file-alt"></i>', titleAttr: 'CSV', title: 'Report Generated by: <?php echo $_SESSION['user_name'] . " on " . $thisDate; ?>'},
                        {extend: 'excel', className: 'btn btn-success', text: '<i class="fas fa-file-excel"></i>', titleAttr: 'Excel', title: 'Report Generated by: <?php echo $_SESSION['user_name'] . " on " . $thisDate; ?>'},
                        {extend: 'pdf', className: 'btn btn-danger', orientation: 'landscape', pageSize: 'LEGAL', text: '<i class="fas fa-file-pdf"></i>', titleAttr: 'PDF', title: 'Report Generated by: <?php echo $_SESSION['user_name'] . " on " . $thisDate; ?>'},
                        {extend: 'print', className: 'btn btn-dark', text: '<i class="fas fa-print"></i>', titleAttr: 'Print', title: 'Report printed by: <?php echo $_SESSION['user_name'] . " on " . $thisDate; ?>'}
                    ],

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
