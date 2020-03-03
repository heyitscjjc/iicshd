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

//edit document
if (isset($_POST['updatedoc'])) {
    $edit_doc_no = $_POST['edit_doc_no'];
    $docstatus = $_POST['edit_status'];
    $docuserno = $_POST['docuserno'];
    $doctitle = $_POST['edit_doc_title'];
	$docISO = $_POST['docISO'];

    $editquery = $conn->prepare("UPDATE documents SET docstatus=?, docdatechange=NOW(), docISO=? WHERE docno=?");
    $editquery->bind_param("ssi", $docstatus, $docISO, $edit_doc_no);
    $editquery->execute();
    $editquery->close();

    $editquery2 = $conn->prepare("UPDATE doclogs SET docstatus=?, docdatechange=NOW() WHERE docno=?");
    $editquery2->bind_param("si", $docstatus, $edit_doc_no);
    $editquery2->execute();
    $editquery2->close();

    if ($editquery == TRUE) {

        $passval = 'Document No. ' . $edit_doc_no . ' changed status to ' . $docstatus . '';

        $passaction = "Update Document Status";
        $logpass = $conn->prepare("INSERT INTO updatelogs VALUES (NULL,?,?,NOW(),?)");
        $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
        $logpass->execute();
        $logpass->close();

        $notiftitle = "Document Status Updated";
        $notifdesc = "Document Title: " . $doctitle . " / Status: " . $docstatus . "";
        $notifaudience = $docuserno;

        $notif = $conn->prepare("INSERT INTO notif VALUES (NULL,?,?,?,?,NOW(),0)");
        $notif->bind_param("isss", $_SESSION['userno'], $notiftitle, $notifdesc, $notifaudience);
        $notif->execute();
        $notif->close();

        header("location: documents.php");
        exit;
    } else {
        echo "Update failed.";
    }
}

//edit announcement
if (isset($_POST['updatedoc2'])) {
    $edit_doc_no = $_POST['edit_doc_no2'];
    $docstatus = $_POST['edit_status2'];
    $docuserno = $_POST['docuserno'];
    $doctitle = $_POST['edit_doc_title2'];
	$docISO = $_POST['docISO'];

    $editquery = $conn->prepare("UPDATE documents SET docstatus=?, docdatechange=NOW(), docISO=? WHERE docno=?");
    $editquery->bind_param("ssi", $docstatus, $docISO ,$edit_doc_no);
    $editquery->execute();
    $editquery->close();

    $editquery2 = $conn->prepare("UPDATE doclogs SET docstatus=?, docdatechange=NOW() WHERE docno=?");
    $editquery2->bind_param("si", $docstatus, $edit_doc_no);
    $editquery2->execute();
    $editquery2->close();

    if ($editquery == TRUE) {

        $passval = 'Document No. ' . $edit_doc_no . ' changed status to ' . $docstatus . '';

        $passaction = "Update Document Status";
        $logpass = $conn->prepare("INSERT INTO updatelogs VALUES (NULL,?,?,NOW(),?)");
        $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
        $logpass->execute();
        $logpass->close();

        $notiftitle = "Document Status Updated";
        $notifdesc = "Document Title: " . $doctitle . " / Status: " . $docstatus . "";
        $notifaudience = $docuserno;

        $notif = $conn->prepare("INSERT INTO notif VALUES (NULL,?,?,?,?,NOW(),0)");
        $notif->bind_param("isss", $_SESSION['userno'], $notiftitle, $notifdesc, $notifaudience);
        $notif->execute();
        $notif->close();

        header("location: documents.php");
        exit;
    } else {
        echo "Update failed.";
    }
}

if (isset($_POST['receiveRel'])) {
    $recDoc = $_POST['recDoc'];
    $docTitle = $_POST['docTitle'];
    $docstatus = "Received by Student";

    $editquery = $conn->prepare("UPDATE documents SET docstatus=?, docdatechange=NOW() WHERE docno=?");
    $editquery->bind_param("si", $docstatus, $recDoc);
    $editquery->execute();
    $editquery->close();

    $editquery2 = $conn->prepare("UPDATE doclogs SET docstatus=?, docdatechange=NOW() WHERE docno=?");
    $editquery2->bind_param("si", $docstatus, $recDoc);
    $editquery2->execute();
    $editquery2->close();

    if ($editquery == TRUE) {

        if ($editquery2 == TRUE) {

            $notiftitle = "Document Status Updated";
            $notifdesc = "Document Title: " . $docTitle . " / Status: " . $docstatus . "";
            $notifaudience = "admin";

            $notif = $conn->prepare("INSERT INTO notif VALUES (NULL,?,?,?,?,NOW(),0)");
            $notif->bind_param("isss", $_SESSION['userno'], $notiftitle, $notifdesc, $notifaudience);
            $notif->execute();
            $notif->close();

            header("location: documents.php");
            exit;
        }
    } else {
        echo "Update failed.";
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

        <!-- DataTable-->
        <link rel="stylesheet" href="../../DataTables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="../../DataTables/Responsive-2.2.1/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="../../DataTables/Buttons-1.5.1/css/buttons.dataTables.min.css">

    </head>

    <body>

        <!--NEW NAVBAR-->

        <?php
			include '../../navbar.php';
		?>


        <div class="container">

            <main role="main" class="col-md-12 ml-sm-auto">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 mt-5">Documents</h1>
                </div>

                <div class="accordion" id="accordionExample">

                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn bg-dark text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    <span class="fas fa-plus-circle"></span> New Submissions
                                </button>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <br>
                            <div class="table-responsive">

                                <table id="data_table" class="table table-striped table-responsive-lg">

                                    <thead>
                                        <tr>
                                            <th>Edit</th>
                                            <th>Document #</th>
                                            <th>Date Submitted</th>
                                            <th>Submitted By</th>
                                            <th>Type</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <?php
                                        $newsubquery = mysqli_query($conn, "SELECT LPAD(documents.docno,4,0), documents.docdatesubmit, users.userno, users.fname, users.mname, users.lname, documents.doctitle,"
                                                . "documents.docdesc, documents.docstatus FROM documents INNER JOIN users WHERE documents.userno = users.userno AND documents.docstatus = 'Submitted at IICS Office' AND documents.hidden = '0'");

                                        if ($newsubquery->num_rows > 0) {
                                            while ($row = $newsubquery->fetch_assoc()) {
                                                $docid = $row['LPAD(documents.docno,4,0)'];
                                                $docdatesubmit = $row['docdatesubmit'];
                                                $userid = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                                                $doctitle = $row['doctitle'];
                                                $docdesc = $row['docdesc'];
                                                $docstatus = $row['docstatus'];
                                                $docuserno = $row['userno'];

                                                echo "<tr>"
                                                . "<td>" . "<a href='#edit" . $docid . "'data-toggle='modal'><button type='button' class='btn btn-dark btn-sm' title='Edit'><span class='fas fa-edit' aria-hidden='true'></span></button></a>" . "</td>"
                                                . "<td>" . $docid . "</td>"
                                                . "<td>" . date("m/d/Y h:iA", strtotime($docdatesubmit)) . "</td>"
                                                . "<td>" . $userid . "</td>"
                                                . "<td>" . $doctitle . "</td>"
                                                . "<td>" . $docdesc . "</td>"
                                                . "<td>" . $docstatus . "</td>";
                                                ?>
                                                <?php
                                                echo '<div id="edit' . $docid . '" class="modal fade" role="dialog">
                                                            <form method="post">
                                                                <div class="modal-dialog modal-lg">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">

                                                                            <h4 class="modal-title">Edit Document #' . $docid . '</h4>
                                                                        </div>

                                                                        <div class="modal-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <input type="hidden" name="edit_doc_no" value="' . $docid . '">
                                                                                    <input type="hidden" name="delete_doc_no" value="' . $docid . '">
                                                                                    <input type="hidden" name="docuserno" value="' . $docuserno . '">
                                                                                    <input type="hidden" name="edit_doc_title" value="' . $doctitle . '">
                                                                                    <p><strong>Document Title: </strong>' . $doctitle . '</p>
                                                                                    <p><strong>Description: </strong>' . $docdesc . '</p>
                                                                                    <p><strong>Date Submitted: </strong>' . date("m/d/Y h:iA", strtotime($docdatesubmit)) . '</p>
                                                                                    <p><strong>Submitted By: </strong>' . $userid . '</p> 
                                                                                    <strong>Update Status: </strong><select name="edit_status" id="edit_status">
                                                                                    <option value="Received by Office"';
                                                if ($docstatus == 'Received by Office') {
                                                    echo "selected";
                                                } echo' >Received by Office
                                                                                    </option>
                                                                                    <option value="Not Received"';
                                                if ($docstatus == 'Not Received') {
                                                    echo "selected";
                                                } echo'>Not Received
                                                                                    </option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <br>
                                                                            <div class="modal-footer">
                                                                                <button style="float: right;" type="button" class="btn btn-secondary btn-m" data-dismiss="modal"><span class="fas fa-times"></span> Cancel</button>
                                                                                <button style="float: right;" type="submit" name="updatedoc" class="btn btn-success btn-m"><span class="fas fa-clipboard-check" ></span> Save Changes</button>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>';
                                            }
											
                                        }
                                        ?>

                                    </tbody>

                                    <tfoot>
                                        <tr>
                                            <th>Edit</th>
                                            <th>Document #</th>
                                            <th>Date Submitted</th>
                                            <th>Submitted By</th>
                                            <th>Type</th>
                                            <th>Description</th>
                                            <th>Status</th>
											
                                        </tr>
                                    </tfoot>
                                </table>
                                <br>
                            </div>
                        </div>

                    </div>

                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn bg-dark text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <span class="fas fa-plus-circle"></span> Archived Documents
                                </button>
                            </h5>
                        </div>

                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                            <div class="card-body"> 

                                <table id="archive" class="table table-striped table-responsive-lg">


                                    <thead>
                                        <tr>
                                            <th>Document #</th>
                                            <th>Date Submitted</th>
                                            <th>Date Modified</th>
                                            <th>Submitted By</th>
                                            <th>Type</th>
                                            <th>Description</th>
                                            <th>Status</th>
											
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <?php
                                        $newsubquery = mysqli_query($conn, "SELECT LPAD(documents.docno,4,0), documents.docdatechange, documents.docdatesubmit, users.fname, users.mname, users.lname, documents.doctitle,"
                                                . "documents.docdesc, documents.docstatus FROM documents INNER JOIN users WHERE documents.userno = users.userno AND documents.docstatus = 'Received by Student'");

                                        if ($newsubquery->num_rows > 0) {
                                            while ($row = $newsubquery->fetch_assoc()) {
                                                $docid = $row['LPAD(documents.docno,4,0)'];
                                                $docdatesubmit = $row['docdatesubmit'];
                                                $userid = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                                                $doctitle = $row['doctitle'];
                                                $docdesc = $row['docdesc'];
                                                $docstatus = $row['docstatus'];
                                                $docdatechange = $row['docdatechange'];

                                                echo "<tr>"
												. "<td>" . $docISO . "</td>"
                                                . "<td>" . $docid . "</td>"
                                                . "<td>" . date("m/d/Y h:iA", strtotime($docdatesubmit)) . "</td>"
                                                . "<td>" . date("m/d/Y h:iA", strtotime($docdatechange)) . "</td>"
                                                . "<td>" . $userid . "</td>"
                                                . "<td>" . $doctitle . "</td>"
                                                . "<td>" . $docdesc . "</td>"
                                                . "<td>" . $docstatus . "</td>";
                                            }
                                        }
                                        ?>

                                    </tbody>

                                    <tfoot>
                                        <tr>
                                            <th>Document #</th>
                                            <th>Date Submitted</th>
                                            <th>Date Modified</th>
                                            <th>Submitted By</th>
                                            <th>Type</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>

                <br>

                <h5>Tracking</h5>
                <hr>

                <div class="table-responsive">

                    <table id="received" class="table table-striped table-responsive-lg">

                        <thead>
                            <tr>
                                <th>Edit</th>
								<th>ISO</th>
                                <th>Document #</th>
                                <th>Date Submitted</th>
                                <th>Date Modified</th>
                                <th>Submitted By</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Status</th>
								<th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <?php
                            $newsubquery = mysqli_query($conn, "SELECT LPAD(documents.docno,4,0), documents.docdatechange, documents.docdatesubmit, documents.docISO, users.userno, users.fname, users.mname, users.lname, documents.doctitle, documents.docdesc, documents.docstatus FROM documents INNER JOIN users "
                                    . "ON documents.userno = users.userno WHERE documents.hidden = '0' AND documents.docstatus != 'Submitted' AND documents.docstatus != 'Received by Student' ORDER BY documents.docno DESC");

                            if ($newsubquery->num_rows > 0) {
                                while ($row = $newsubquery->fetch_assoc()) {
                                    $docid = $row['LPAD(documents.docno,4,0)'];
                                    $docdatesubmit = $row['docdatesubmit'];
                                    $userid = ($row['fname'] . ' ' . $row['lname']);
                                    $doctitle = $row['doctitle'];
                                    $docdesc = $row['docdesc'];
									$docISO = $row['docISO'];
                                    $docstatus = $row['docstatus'];
                                    $docdatechange = $row['docdatechange'];
                                    $doceditedby = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                                    $docuserno = $row['userno'];

                                    echo "<tr>";
                                    if ($docstatus == 'Received by Student') {
                                        echo '<td> - </td>';
                                    } else {
                                        echo
                                        "<td>" . "<a href='#edit2" . $docid . "'data-toggle='modal'><button type='button' class='btn btn-dark btn-sm' title='Edit'><span class='fas fa-edit' aria-hidden='true'></span></button></a>" . "</td>";
                                    } echo
									"<td>" . $docISO . "</td>"
                                    . "<td>" . $docid . "</td>"
                                    . "<td>" . date("m/d/Y h:iA", strtotime($docdatesubmit)) . "</td>"
                                    . "<td>" . date("m/d/Y h:iA", strtotime($docdatechange)) . "</td>"
                                    . "<td>" . $userid . "</td>"
                                    . "<td>" . $doctitle . "</td>"
                                    . "<td>" . $docdesc . "</td>"
                                    . "<td>" . $docstatus . "</td>";
                                    ?>
                                    <?php
                                    echo '<div id="edit2' . $docid . '" class="modal fade" role="dialog">
                                                            <form method="post">
                                                                <div class="modal-dialog modal-lg">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">

                                                                            <h4 class="modal-title">Edit Document #' . $docid . '</h4>
                                                                        </div>

                                                                        <div class="modal-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <input type="hidden" name="edit_doc_no2" value="' . $docid . '">
                                                                                    <input type="hidden" name="edit_doc_title2" value="' . $doctitle . '">
                                                                                    <input type="hidden" name="docuserno" value="' . $docuserno . '">
                                                                                    <p><strong>Document Title: </strong>' . $doctitle . '</p>
                                                                                    <p><strong>Description: </strong>' . $docdesc . '</p>
                                                                                    <p><strong>Date Submitted: </strong>' . date("m/d/Y h:iA", strtotime($docdatesubmit)) . '</p>
																					<p><strong>ISO: </strong>' . $docISO . '</p> 
																					<p><strong>Change ISO: </strong><input type="textbox" name="docISO" id="docISO" value="'. $docISO .'"></p>
                                                                                    <p><strong>Submitted By: </strong>' . $userid . '</p>  
                                                                                         <strong>Update Status: </strong><select name="edit_status2" id="edit_status2">
                                                                                    
                                                                                    <option value="On-Process"';
                                    if ($docstatus == 'On-Process') {
                                        echo "selected";
                                    } echo'>On-Process
                                                                                    </option>
                                                                                    <option value="Processed"';
                                    if ($docstatus == 'Processed') {
                                        echo "selected";
                                    } echo'>Processed
                                                                                    </option>
                                                                                    <option value="For Release"';
                                    if ($docstatus == 'For Release') {
                                        echo "selected";
                                    } echo'>For Release
                                                                                    </option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <br>
                                                                            <div class="modal-footer">
                                                                                <button style="float: right;" type="button" class="btn btn-secondary btn-m" data-dismiss="modal"><span class="fas fa-times"></span> Cancel</button>
                                                                                <button style="float: right;" type="submit" name="updatedoc2" class="btn btn-success btn-m"><span class="fas fa-clipboard-check" ></span> Save Changes</button>
                                                                                 
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>';
									if ($docstatus == 'For Release') {
                                        echo '<td>'
                                        . '<form method="post">'
                                        . '<input type = "hidden" name="recDoc" value="' . $docid . '">'
                                        . '<input type = "hidden" name="docTitle" value="' . $doctitle . '">'
                                        . '<button type = "submit" class="btn btn-success btn-sm" name ="receiveRel"><span class="fas fa-check"></span></button>'
                                        . '</td></tr>';
                                    } else {
                                        echo '<td> - </td></tr>';
                                    }
                                }
								
                            }
                            ?>

                        </tbody>

                        <tfoot>
                            <tr>
                                <th>Edit</th>
								<th>ISO</th>
                                <th>Document #</th>
                                <th>Date Submitted</th>
                                <th>Date Modified</th>
                                <th>Submitted By</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Status</th>
								<th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                    <br>
                </div>

                <br><br><br>
            </main>
        </div>
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
    <script src="../../js/jquery-3.3.1.js"></script>
    <script>window.jQuery || document.write('<script src = "../../js/jquery-3.3.1.js"><\/script>')</script>
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

                initComplete: function () {
                    this.api().columns([1, 2, 3, 4, 5, 6, 7, 8]).every(function () {
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

            $('#archive').DataTable({

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

            $('#received').DataTable({

                initComplete: function () {
                    this.api().columns([1, 2, 3, 4, 5, 6, 7, 8]).every(function () {
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
