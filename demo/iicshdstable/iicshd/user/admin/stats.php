
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
                    <h1 class="h2">Statistics</h1>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Total # of Queued Students based on Queue Status</h5>
                            </div>
                            <div class="card-body">
                                <div id="chart-container" style="height:300px; width:580px">       
                                    <canvas id="piechart"></canvas>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>

                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Total # of Queued Students based on Transaction Type</h5>
                            </div>
                            <div class="card-body">
                                <div id="chart-container" style="height:300px; width:580px">       
                                    <canvas id="barchart"></canvas>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>


                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>Total # of Documents based on Document Status</h5>
                            </div>
                            <div class="card-body">
                                <div id="chart-container">       
                                    <canvas id="barchart2"></canvas>
                                </div>
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

        <!-- Graphs -->
        <script src="../../js/Chart.min.js"></script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: "../../include/firstChart.php",
                    method: "GET",
                    success: function (data) {
                        console.log(data);
                        var qstatus = [];
                        var qno = [];

                        for (var i in data) {
                            qstatus.push(data[i].qstatus);
                            qno.push(data[i].qno);
                        }

                        var chartdata = {
                            labels: qstatus,
                            datasets: [
                                {
                                    label: 'Queue Status',
                                    backgroundColor: [
                                        "#007E33",
                                        "#CC0000"
                                    ],
                                    borderColor: 'rgba(200, 200, 200, 0.75)',
                                    hoverBackgroundColor: [
                                        "#00C851",
                                        "#ff4444"
                                    ],
                                    hoverBorderColor: 'rgba(200, 200, 200, 1)',
                                    data: qno
                                }
                            ]
                        };

                        var ctx = $("#piechart");

                        var piegraph = new Chart(ctx, {
                            type: 'pie',
                            data: chartdata
                        });
                    },
                    error: function (data) {
                        console.log(data);
                    }
                });
            });

            $(document).ready(function () {
                $.ajax({
                    url: "../../include/secondChart.php",
                    method: "GET",
                    success: function (data) {
                        console.log(data);
                        var qtype = [];
                        var qno = [];

                        for (var i in data) {
                            qtype.push(data[i].qtype);
                            qno.push(data[i].qno);
                        }

                        var chartdata = {
                            labels: qtype,
                            datasets: [
                                {
                                    label: '# of Queued Students',
                                    backgroundColor: [

                                        'rgba(255,99,132,1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(75, 192, 192, 1)',
                                        'rgba(153, 102, 255, 1)'
                                    ],
                                    borderColor: 'rgba(200, 200, 200, 0.75)',
                                    hoverBackgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(255, 206, 86, 0.2)',
                                        'rgba(75, 192, 192, 0.2)',
                                        'rgba(153, 102, 255, 0.2)'

                                    ],
                                    hoverBorderColor: 'rgba(200, 200, 200, 1)',
                                    data: qno
                                }
                            ]
                        };

                        var ctx = $("#barchart");

                        var bargraph = new Chart(ctx, {
                            type: 'horizontalBar',
                            data: chartdata
                        });
                    },
                    error: function (data) {
                        console.log(data);
                    }
                });
            });

            $(document).ready(function () {
                $.ajax({
                    url: "../../include/thirdChart.php",
                    method: "GET",
                    success: function (data) {
                        console.log(data);
                        var docstatus = [];
                        var docno = [];

                        for (var i in data) {
                            docstatus.push(data[i].docstatus);
                            docno.push(data[i].docno);
                        }

                        var chartdata = {
                            labels: docstatus,
                            datasets: [
                                {
                                    label: '# of Documents',
                                    backgroundColor: [

                                        'rgba(255,99,132,1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(75, 192, 192, 1)',
                                        'rgba(153, 102, 255, 1)',
                                        'rgba(255, 159, 64, 1)'
                                    ],
                                    borderColor: 'rgba(200, 200, 200, 0.75)',
                                    hoverBackgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(255, 206, 86, 0.2)',
                                        'rgba(75, 192, 192, 0.2)',
                                        'rgba(153, 102, 255, 0.2)',
                                        'rgba(255, 159, 64, 0.2)'

                                    ],
                                    hoverBorderColor: 'rgba(200, 200, 200, 1)',
                                    data: docno
                                }
                            ]
                        };

                        var ctx = $("#barchart2");

                        var bargraph = new Chart(ctx, {
                            type: 'bar',
                            data: chartdata
                        });
                    },
                    error: function (data) {
                        console.log(data);
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
