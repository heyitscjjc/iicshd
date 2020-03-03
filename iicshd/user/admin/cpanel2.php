
<?php
include '../../include/controller.php';
include '../../include/upload.php';

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

if (isset($_GET['activate'])) {
    $activate = $_GET['activate'];
} else {
    $activate = '';
}

if (isset($_GET['deactivate'])) {
    $deactivate = $_GET['deactivate'];
} else {
    $deactivate = '';
}

if (isset($_GET['activate2'])) {
    $activate2 = $_GET['activate2'];
} else {
    $activate2 = '';
}

if (isset($_GET['deactivate2'])) {
    $deactivate2 = $_GET['deactivate2'];
} else {
    $deactivate2 = '';
}

if (isset($_GET['updatesec'])) {
    $updatesec = $_GET['updatesec'];
} else {
    $updatesec = '';
}


if (isset($_POST['deactivate'])) {
// sql to deactivate a record
    $deactivate_id = $_POST['deactivate_id'];
    $deacname = $_POST['deacname'];

    $bool = TRUE;

    if ($bool == TRUE) {
        $sql = "UPDATE users SET hidden = 1 where userno='$deactivate_id'";
        if ($conn->query($sql) === TRUE) {
            $sql = "UPDATE users SET hidden = 1 where userno='$deactivate_id'";
            if ($conn->query($sql) === TRUE) {

                $_GET['deactivate'] = 'success';
                header("location: cpanel2.php?deactivate=success");
            } else {
                echo "Error deleting record: " . $conn->error;
            }
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    } else {
        $_GET['deactivate'] = 'failed';
        header("location: cpanel2.php?deactivate=failed");
    }
}

if (isset($_POST['deactivate2'])) {
// sql to deactivate a record
    $deactivate_id = $_POST['deactivate_id2'];
    $deacname = $_POST['deacname2'];

    $bool = TRUE;

    if ($bool == TRUE) {
        $sql = "UPDATE users SET hidden = 1 where userno='$deactivate_id'";
        if ($conn->query($sql) === TRUE) {
            $sql = "UPDATE users SET hidden = 1 where userno='$deactivate_id'";
            if ($conn->query($sql) === TRUE) {

                $_GET['deactivate2'] = 'success';
                header("location: cpanel2.php?deactivate2=success");
            } else {
                echo "Error deleting record: " . $conn->error;
            }
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    } else {
        $_GET['deactivate2'] = 'failed';
        header("location: cpanel2.php?deactivate2=failed");
    }
}

if (isset($_POST['activate'])) {
// sql to activate a record
    $activate_id = $_POST['activate_id'];
    $acname = $_POST['acname'];

    $sql = "UPDATE users SET hidden = 0 where userno='$activate_id'";
    if ($conn->query($sql) === TRUE) {
        $sql = "UPDATE users SET hidden = 0 where userno='$activate_id'";

        if ($conn->query($sql) === TRUE) {
            $_GET['activate'] = 'success';
            header("location: cpanel2.php?activate=success");
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    } else {
        echo "Error deleting record: " . $conn->error;
    }
}

if (isset($_POST['activate2'])) {
// sql to activate a record
    $activate_id = $_POST['activate_id2'];
    $acname = $_POST['acname2'];

    $sql = "UPDATE users SET hidden = 0 where userno='$activate_id'";
    if ($conn->query($sql) === TRUE) {
        $sql = "UPDATE users SET hidden = 0 where userno='$activate_id'";

        if ($conn->query($sql) === TRUE) {
            $_GET['activate2'] = 'success';
            header("location: cpanel2.php?activate2=success");
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    } else {
        echo "Error deleting record: " . $conn->error;
    }
}

if (isset($_POST['updatefac'])) {
// sql to activate a record
    $activate_id = $_POST['activate_id2'];
    $acname = $_POST['acname2'];
    $updatestat = $_POST['updatefacsec'];

    $notif = $conn->prepare("UPDATE users SET section = ? where userno=?");
    $notif->bind_param("si", $updatestat, $activate_id);
    $notif->execute();
    $notif->close();

    if ($notif == TRUE) {

        $_GET['updatesec'] = 'success';
        header("location: cpanel2.php?updatesec=success");
    } else {
//        echo "Error deleting record: " . $conn->error;
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

            th { font-size: 14px; }
            td { font-size: 14px; }
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
                if ($activate == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Account activated successfully!</div>';
                } else {
                    echo '';
                }

                if ($activate2 == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Account activated successfully!</div>';
                } else {
                    echo '';
                }

                if ($updatesec == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Updated Faculty status successfully!</div>';
                } else {
                    echo '';
                }

                if ($deactivate == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Account deactivated successfully!</div>';
                } else {
                    echo '';
                }

                if ($deactivate2 == TRUE) {
                    echo '<div class="alert alert-success"><span class="fas fa-check"></span> Account deactivated successfully!</div>';
                } else {
                    echo '';
                }
                ?>

                <div class="row">

                    <div class="col-sm-3">
                        <div class="card">
                            <ul class="list-group list-group-flush">
                                <a href="cpanel.php"><li class="list-group-item">General <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel2.php"><li class="list-group-item active">User Accounts <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel3.php"><li class="list-group-item">Queue Settings <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel4.php"><li class="list-group-item">Manage Uploads <span class="fas fa-caret-right float-right"></span></li></a>
                                <a href="cpanel5.php"><li class="list-group-item">Create Admin <span class="fas fa-caret-right float-right"></span></li></a>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="card">
                            <h4 class="card-header">User Accounts</h4>
                            <div class="card-body">
                                <div class="alert alert-secondary"><span class="fas fa-exclamation-circle"></span>
                                    The list of all users can be found in this page. As an administrator, you may view and activate/deactivate accounts.
                                </div>

                                <!-- Nav pills -->
                                <ul class="nav nav-tabs nav-justified">
                                    <li class="nav-item">
                                        <a class="list-group-item active" data-toggle="tab" href="#student">Student</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="list-group-item" data-toggle="tab" href="#faculty">Faculty</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="list-group-item" data-toggle="tab" href="#admin">Admin</a>
                                    </li>
                                </ul>

                                <br>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane container active" id="student">
                                        <table id="students" class="table table-striped table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Student #</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Section</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php
                                                $query = mysqli_query($conn, "SELECT * FROM users WHERE role = 'student'");
                                                if ($query->num_rows > 0) {
                                                    while ($row = $query->fetch_assoc()) {
                                                        $getuno = $row['userno'];
                                                        $getuid = $row['userid'];
                                                        $getuname = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                                                        $getumail = $row['email'];
                                                        $getusection = $row['section'];
                                                        $getstatus = $row['hidden'];

                                                        echo "<tr>"
                                                        . "<td>" . $getuid . "</td>"
                                                        . "<td>" . $getuname . "</td>"
                                                        . "<td>" . $getumail . "</td>"
                                                        . "<td>" . $getusection . "</td>";
                                                        if ($getstatus == 0) {
                                                            echo "<td> Active </td>"
                                                            . "<td>" . "<a href='#deactivate" . $getuno . "'data-toggle='modal'><button type='button' class='btn btn-danger btn-sm' title='Deactivate'><span class='fas fa-lock' aria-hidden='true'></span></button></a>" . "</td>";
                                                        } else {
                                                            echo "<td> Deactivated </td>"
                                                            . "<td>" . "<a href='#activate" . $getuno . "'data-toggle='modal'><button type='button' class='btn btn-success btn-sm' title='Activate'><span class='fas fa-lock' aria-hidden='true'></span></button></a>" . "</td>";
                                                        }

                                                        echo '<div id="activate';
                                                        echo $getuno;
                                                        echo'" class="modal fade" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                    <form method="post">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <h4 class="modal-title">Activate</h4>
                                                                            </div>

                                                                            <div class="modal-body">
                                                                                <input type="hidden" name="activate_id" value="';
                                                        echo $getuno;
                                                        echo '">
                                                                                <input type="hidden" name="acname" value="';
                                                        echo $getuname;
                                                        echo '">

                                                                                <div class="alert alert-warning"><p>Are you sure you want to ACTIVATE account of <strong>';
                                                        echo $getuname;
                                                        echo'</strong>?</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" name="activate" class="btn btn-success"><span class="fas fa-check"></span> YES</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> NO</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>


                                                            <div id="deactivate';
                                                        echo $getuno;
                                                        echo'" class="modal fade" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                    <form method="post">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <h4 class="modal-title">Deactivate</h4>
                                                                            </div>

                                                                            <div class="modal-body">
                                                                                <input type="hidden" name="deactivate_id" value="';
                                                        echo $getuno;
                                                        echo'">
                                                                                <input type="hidden" name="deacname" value="';
                                                        echo $getuname;
                                                        echo'">

                                                                                <div class="alert alert-warning"><p>Are you sure you want to DEACTIVATE account of <strong>';
                                                        echo $getuname;
                                                        echo'</strong>?</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" name="deactivate" class="btn btn-success"><span class="fas fa-check"></span> YES</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> NO</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>';
                                                    }
                                                }
                                                ?>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Student #</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Section</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                    <div class="tab-pane container fade" id="faculty">
                                        <table id="facultymembers" class="table table-striped table-responsive table-lg">
                                            <thead>
                                                <tr>
                                                    <th>Faculty #</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php
                                                $query2 = mysqli_query($conn, "SELECT * FROM users WHERE role = 'faculty'");
                                                if ($query2->num_rows > 0) {
                                                    while ($row2 = $query2->fetch_assoc()) {
                                                        $getuno2 = $row2['userno'];
                                                        $getuid2 = $row2['userid'];
                                                        $getuname2 = ($row2['fname'] . ' ' . $row2['mname'] . ' ' . $row2['lname']);
                                                        $getumail2 = $row2['email'];
                                                        $getstatus2 = $row2['hidden'];
                                                        $getrole = $row2['section'];

                                                        echo "<tr>"
                                                        . "<td>" . $getuid2 . "</td>"
                                                        . "<td>" . $getuname2 . "</td>"
                                                        . "<td>" . $getumail2 . "</td>";
                                                        if ($getstatus2 == 0) {
                                                            echo "<td> Active </td>"
                                                            . "<td>" . "<a href='#deactivate" . $getuno2 . "'data-toggle='modal'><button type='button' class='btn btn-danger btn-sm' title='Deactivate'><span class='fas fa-lock' aria-hidden='true'></span></button></a>" . "</td>";
                                                        } else {
                                                            echo "<td> Deactivated </td>"
                                                            . "<td>" . "<a href='#activate" . $getuno2 . "'data-toggle='modal'><button type='button' class='btn btn-success btn-sm' title='Activate'><span class='fas fa-lock' aria-hidden='true'></span></button></a>" . "</td>";
                                                        }
                                                        echo
                                                        "<td>" . "<a href='#edit" . $getuno2 . "'data-toggle='modal'><button type='button' class='btn btn-dark btn-sm' title='Edit'><span class='fas fa-edit' aria-hidden='true'></span></button></a>" . "</td>";

                                                        echo '<div id="edit';
                                                        echo $getuno2;
                                                        echo'" class="modal fade" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                    <form method="post">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <h4 class="modal-title">Edit ' . $getuname2 . '</h4>
                                                                            </div>

                                                                            <div class="modal-body">
                                                                                <input type="hidden" name="activate_id2" value="';
                                                        echo $getuno2;
                                                        echo '">
                                                                                <input type="hidden" name="acname2" value="';
                                                        echo $getuname2;
                                                        echo '">
                                                                                <b>Current Status: </b>';
                                                        if ($getrole == "faculty") {
                                                            echo "Faculty";
                                                        } if ($getrole == "itchair") {
                                                            echo "IT Department Chair";
                                                        } if ($getrole == "ischair") {
                                                            echo "IS Department Chair";
                                                        } if ($getrole == "cschair") {
                                                            echo "CS Department Chair";
                                                        } if ($getrole == "swdb") {
                                                            echo "SWDB Coordinator";
                                                        }
                                                        echo'
                                                                                <div class="form-group">
                                                                                   <b>Update Status: </b>
                                                                                     <select name="updatefacsec" class="form-control">
                                                                                        <option value="itchair">IT Department Chair</option>
                                                                                        <option value="swdb">SWDB Coordinator</option>
                                                                                        <option value="ischair">IS Department Chair</option>
                                                                                        <option value="cschair">CS Department</option>
                                                                                        <option value="faculty">Faculty</option>
                                                                                      </select>
                                                                                </div>
                                                                                
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" name="updatefac" class="btn btn-success"><span class="fas fa-check"></span> Update</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> Cancel</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>';


                                                        echo '<div id="activate';
                                                        echo $getuno2;
                                                        echo'" class="modal fade" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                    <form method="post">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <h4 class="modal-title">Activate</h4>
                                                                            </div>

                                                                            <div class="modal-body">
                                                                                <input type="hidden" name="activate_id2" value="';
                                                        echo $getuno2;
                                                        echo '">
                                                                                <input type="hidden" name="acname2" value="';
                                                        echo $getuname2;
                                                        echo '">

                                                                                <div class="alert alert-warning"><p>Are you sure you want to ACTIVATE account of <strong>';
                                                        echo $getuname2;
                                                        echo'</strong>?</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" name="activate2" class="btn btn-success"><span class="fas fa-check"></span> YES</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> NO</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>


                                                            <div id="deactivate';
                                                        echo $getuno2;
                                                        echo'" class="modal fade" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                    <form method="post">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <h4 class="modal-title">Deactivate</h4>
                                                                            </div>

                                                                            <div class="modal-body">
                                                                                <input type="hidden" name="deactivate_id2" value="';
                                                        echo $getuno2;
                                                        echo'">
                                                                                <input type="hidden" name="deacname2" value="';
                                                        echo $getuname2;
                                                        echo'">

                                                                                <div class="alert alert-warning"><p>Are you sure you want to DEACTIVATE account of <strong>';
                                                        echo $getuname2;
                                                        echo'</strong>?</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" name="deactivate2" class="btn btn-success"><span class="fas fa-check"></span> YES</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> NO</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>';
                                                    }
                                                }
                                                ?>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Faculty #</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                    <div class="tab-pane container fade" id="admin">
                                        <table id="adminmembers" class="table table-striped table-lg">
                                            <thead>
                                                <tr>
                                                    <th>Username</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php
                                                $query = mysqli_query($conn, "SELECT * FROM users WHERE role = 'admin' AND userno != '" . $_SESSION['userno'] . "'");
                                                if ($query->num_rows > 0) {
                                                    while ($row = $query->fetch_assoc()) {
                                                        $getuno = $row['userno'];
                                                        $getuid = $row['userid'];
                                                        $getuname = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                                                        $getumail = $row['email'];
                                                        $getusection = $row['section'];
                                                        $getstatus = $row['hidden'];

                                                        echo "<tr>"
                                                        . "<td>" . $getuid . "</td>"
                                                        . "<td>" . $getuname . "</td>"
                                                        . "<td>" . $getusection . "</td>";
                                                        if ($getstatus == 0) {
                                                            echo "<td> Active </td>"
                                                            . "<td>" . "<a href='#deactivate" . $getuno . "'data-toggle='modal'><button type='button' class='btn btn-danger btn-sm' title='Deactivate'><span class='fas fa-lock' aria-hidden='true'></span></button></a>" . "</td>";
                                                        } else {
                                                            echo "<td> Deactivated </td>"
                                                            . "<td>" . "<a href='#activate" . $getuno . "'data-toggle='modal'><button type='button' class='btn btn-success btn-sm' title='Activate'><span class='fas fa-lock' aria-hidden='true'></span></button></a>" . "</td>";
                                                        }

                                                        echo '<div id="activate';
                                                        echo $getuno;
                                                        echo'" class="modal fade" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                    <form method="post">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <h4 class="modal-title">Activate</h4>
                                                                            </div>

                                                                            <div class="modal-body">
                                                                                <input type="hidden" name="activate_id" value="';
                                                        echo $getuno;
                                                        echo '">
                                                                                <input type="hidden" name="acname" value="';
                                                        echo $getuname;
                                                        echo '">

                                                                                <div class="alert alert-warning"><p>Are you sure you want to ACTIVATE account of <strong>';
                                                        echo $getuname;
                                                        echo'</strong>?</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" name="activate" class="btn btn-success"><span class="fas fa-check"></span> YES</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> NO</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>


                                                            <div id="deactivate';
                                                        echo $getuno;
                                                        echo'" class="modal fade" role="dialog">
                                                                <div class="modal-dialog modal-lg">
                                                                    <form method="post">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <h4 class="modal-title">Deactivate</h4>
                                                                            </div>

                                                                            <div class="modal-body">
                                                                                <input type="hidden" name="deactivate_id" value="';
                                                        echo $getuno;
                                                        echo'">
                                                                                <input type="hidden" name="deacname" value="';
                                                        echo $getuname;
                                                        echo'">

                                                                                <div class="alert alert-warning"><p>Are you sure you want to DEACTIVATE account of <strong>';
                                                        echo $getuname;
                                                        echo'</strong>?</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" name="deactivate" class="btn btn-success"><span class="fas fa-check"></span> YES</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fas fa-times"></span> NO</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>';
                                                    }
                                                }
                                                ?>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Student #</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </tfoot>
                                        </table>
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

                $('#students').DataTable({
                    "bLengthChange": true,
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

            $(document).ready(function () {
<?php
$thisDate = date("m/d/Y");
?>

                $('#facultymembers').DataTable({
                    "bLengthChange": true,
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

            $(document).ready(function () {
<?php
$thisDate = date("m/d/Y");
?>

                $('#adminmembers').DataTable({
                    "bLengthChange": true,
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
