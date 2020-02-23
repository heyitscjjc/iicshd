<?php

// Check if image file is a actual image or fake image
if (isset($_POST["uploadFile"])) {

    $fileName = $_POST['fileName'];

    $date = date("m/d/Y");

    $target_dir = "../../uploads/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $docFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));


    // Check if file already exists
    if (file_exists($target_file)) {
//        echo "Sorry, file already exists.";
        $_GET['uploadfail'] = 'success';
        header("Location: cpanel.php?uploadfail=success");
        $uploadOk = 0;
    }
// Check file size
    if ($_FILES["fileToUpload"]["size"] > 20000000) {
//        echo "Sorry, your file is too large.";
        $_GET['uploadfail'] = 'success';
        header("Location: cpanel.php?uploadfail=success");
        $uploadOk = 0;
    }

// Allow certain file formats
    if ($docFileType != "pdf" && $docFileType != "docx" && $docFileType != "doc") {
//        echo "Sorry, only PDF, DOCX, & DOC files are allowed.";
        $_GET['uploadfail'] = 'success';
        header("Location: cpanel.php?uploadfail=success");
        $uploadOk = 0;
    }

// Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $_GET['uploadfail'] = 'success';
        header("Location: cpanel.php?uploadfail=success");
//        echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            $_GET['upload'] = 'success';

            $passval = 'Document template uploaded.';

            $passaction = "File Upload";
            $logpass = $conn->prepare("INSERT INTO updatelogs VALUES (NULL,?,?,NOW(),?)");
            $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
            $logpass->execute();
            $logpass->close();

            $notiftitle = "New File Upload";
            $notifdesc = "New File Available: " . $_FILES['fileToUpload']['name'] . ".";
            $notifaudience = "student";
            
            $notif = $conn->prepare("INSERT INTO notif VALUES (NULL,?,?,?,?,NOW(),0)");
            $notif->bind_param("isss", $_SESSION['userno'], $notiftitle, $notifdesc, $notifaudience);
            $notif->execute();
            $notif->close();

            $fileSql = $conn->prepare("INSERT INTO files VALUES (NULL,?,?,NOW(),'0')");
            $fileSql->bind_param("ss", $fileName, $_FILES["fileToUpload"]["name"]);
            $fileSql->execute();
            $fileSql->close();

            header("Location: cpanel.php?upload=success");

//            echo "The file " . basename($_FILES["fileToUpload"]["name"]) . " has been uploaded.";
        } else {
//            echo "Sorry, there was an error uploading your file.";
        }
    }
}
?>