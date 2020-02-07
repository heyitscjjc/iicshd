<?php

//connect to db
session_start();
require 'dbconn.php';
require 'clean.php';
date_default_timezone_set("Asia/Manila");
$date = date("Y-m-d");
$thisDate = date("Y-m-d");
$date_time = date("Y-m-d h:i:sa");

//initial variables
$userid = $password = $email = $success = $fail = $passwordErr = $registerSuccess = $usernameErr = $usernameErr2 = $seq = $answerErr = $dept = "";
$confirmErr = $resetpasswordErr = "";
$updateBool = true;

//login
if (isset($_POST['login'])) {

    //login credentials
    $userid = $_POST["userid"];
    $password = $_POST["password"];

    $checker = $conn->prepare("SELECT * FROM users WHERE userid = ? AND  HIDDEN = 0 AND VERIFIED = 1");
    $checker->bind_param("s", $userid);
    $checker->execute();
    $result = $checker->get_result();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {

            $hashedPwdCheck = password_verify($password, $row['password']);
            if ($hashedPwdCheck == FALSE) {
                $passwordErr = '<div class="alert alert-danger">
                        Login Failed!
                        </div>';
                $userno = $row['userno'];
                $userid = $row['userid'];
                $name = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                $role = $row['role'];
            } elseif ($hashedPwdCheck == TRUE) {
                $name = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                $_SESSION['user_name'] = $name;
                $_SESSION['userid'] = $row['userid'];
                $_SESSION['email'] = $row['email'];
                $_SESSION['role'] = $row['role'];
                $_SESSION['fname'] = $row['fname'];
                $_SESSION['mname'] = $row['mname'];
                $_SESSION['lname'] = $row['lname'];
                $_SESSION['userno'] = $row['userno'];
                $_SESSION['section'] = $row['section'];
				$_SESSION['dept'] = $row['deptno'];
                $_SESSION['last_time'] = time();
                $_SESSION['resetpass'] = $row['forgotpass'];


                if ($_SESSION['role'] == "admin") {
                    if ($_SESSION['resetpass'] == 1) {
                        header("location:/iicshd/reset.php");
                        exit();
                    } else {

                        $passaction = 'Login';

                        $passval = "Logged in successfully.";
                        $logpass = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
                        $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
                        $logpass->execute();
                        $logpass->close();

                        header("location:/iicshd/user/admin/home.php");
                        exit();
                    }
                }
                if ($_SESSION['role'] == "student") {
                    if ($_SESSION['resetpass'] == 1) {
                        header("location:/iicshd/reset.php");
                        exit();
                    } else {

                        $passaction = 'Login';

                        $passval = "Logged in successfully.";
                        $logpass = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
                        $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
                        $logpass->execute();
                        $logpass->close();

                        header("location:/iicshd/user/student/home.php");
                        exit();
                    }
                }
                if ($_SESSION['role'] == "faculty") {
                    if ($_SESSION['resetpass'] == 1) {
                        header("location:/iicshd/reset.php");
                        exit();
                    } else {

                        $passaction = 'Login';

                        $passval = "Logged in successfully.";
                        $logpass = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
                        $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
                        $logpass->execute();
                        $logpass->close();
                        
                        header("location:/iicshd/user/faculty/home.php");
                        exit();
                    }
                }
				if ($_SESSION['role'] == "organizati") {
                    if ($_SESSION['resetpass'] == 1) {
                        header("location:/iicshd/reset.php");
                        exit();
                    } else {

                        $passaction = 'Login';

                        $passval = "Logged in successfully.";
                        $logpass = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
                        $logpass->bind_param("sss", $passaction, $_SESSION['user_name'], $passval);
                        $logpass->execute();
                        $logpass->close();
                        
                        header("location:/iicshd/user/organization/home.php");
                        exit();
                    }
                }
            }
        }
    } else {

        $passwordErr = '<div class="alert alert-danger">
                        Login Failed!
                        </div>';
    }
}

if (isset($_POST['forgotPass'])) {
    $email = $_POST['email'];

    $_SESSION['requser'] = $email;
    //$checker = "SELECT * FROM personnel WHERE BINARY USERNAME = '$username' AND  HIDDEN = 0";
    $checker = $conn->prepare("SELECT * FROM users WHERE email = ? AND  hidden = 0");
    $checker->bind_param("s", $email);
    $checker->execute();
    $resultcheck = $checker->get_result();

    if ($resultcheck->num_rows > 0) {
        $usernameErr = '<div class="alert alert-success">
                        <strong> User</strong> found!
                        </div>';
        $usernameErr2 = '<form method = "POST" action="">
                        <button type = "submit" class="btn btn-success btn-block" name="requestNew">Request for Password Change</button>';
        $updatebool = FALSE;
    } if ($resultcheck->num_rows == 0) {
        $usernameErr = '<div class="alert alert-danger">
                        </span><strong> User</strong> not found.
                        </div>';
    }
}

if (isset($_POST['requestNew'])) {
    $email = $_POST['email'];

    $sql = "SELECT SECQ from secq where SECQNO=(SELECT SECQNO from users WHERE email='$email')";
    $result = mysqli_query($conn, $sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $seq = $row['SECQ'];
        }
        $_SESSION['seq'] = $seq;
        $_SESSION['requser'] = $email;
        header("location:/iicshd/security.php");
        exit;
    } else {
        echo 'No security question found.';
    }
}

if (isset($_POST['submitAnswer'])) {

    $requser = $_SESSION['requser'];
    $reqname = "";
    $securityans = $_POST['securityans'];


    $sql = "SELECT SECQA from users where email='$requser'";
    $result = mysqli_query($conn, $sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $checkans = $row['SECQA'];
        }
        $hashedans = password_verify($securityans, $checkans);
        if ($hashedans == TRUE) {
            $getpno = "SELECT userno,FNAME,MNAME,LNAME FROM users WHERE email='$requser'";
            $resultpno = mysqli_query($conn, $getpno);
            if ($resultpno->num_rows > 0) {
                while ($row = $resultpno->fetch_assoc()) {
                    $reqpno = $row['userno'];
                    $reqname = $row['FNAME'] . ' ' . $row['MNAME'] . ' ' . $row['LNAME'];
                }
            }


//            $sql2 = "INSERT INTO authlistpass VALUES ('','$reqpno','0')";
//            if ($sql2 == TRUE) {
//                $reqpassresult = mysqli_query($conn, $sql2);
//                $userval = 'Personnel ID: ' . $requser . ' / ' . $reqname . ' requested';
//
//                $useraction = "Forgot Password";
//
//                $loguser = $conn->prepare("INSERT INTO updatelogs VALUES ('',?,?,NOW(),?)");
//                $loguser->bind_param("sss", $useraction, $reqname, $userval);
//                $loguser->execute();
//                $loguser->close();
            $_SESSION['param'] = "successChange";
            header("location:/iicshd/securitysuccess.php");
        } else {
            $answerErr = '<div class="alert alert-danger">
                        <strong>Security Answer</strong> incorrect.
                        </div>';
        }
    }
}

if (isset($_POST["resetlogin"])) {
    //   $newUsername = clean($_POST["newUsername"]);
    $newPassword = clean($_POST["newPassword"]);
    $confirm = clean($_POST["confirm"]);
    $newToken = 0;

    if (!preg_match("/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/", $newPassword)) {
        $resetpasswordErr = '<div class="alert alert-warning">
                       Your password must be atleast 8 characters long and must be a combination of uppercase letters, lowercase letters and numbers.
                        </div>';
        $updateBool = FALSE;
    }

    if (strlen($newPassword) < 8) {
        $pwdShort = '<div class="alert alert-warning">
                        Your password must be atleast 8 characters long and must be a combination of uppercase letters, lowercase letters and numbers.
                        </div>';
        $updateBool = FALSE;
    }
    if ($newPassword != $confirm) {
        $confirmErr = '<div class="alert alert-warning">
                        Password does not match the confirm password.
                        </div>';
        $updateBool = FALSE;
    } else {
        if ($updateBool == TRUE) {
            $hashedPwd = password_hash($newPassword, PASSWORD_DEFAULT);

            $sqlupdate = "UPDATE users SET users.password= '$hashedPwd', users.forgotpass='0' WHERE users.userno= '" . $_SESSION['userno'] . "'";
            $sql = "SELECT * FROM users WHERE userno ='" . $_SESSION['userno'] . "'";
            if ($sqlupdate == TRUE) {
                $updateresul = mysqli_query($conn, $sqlupdate);
                $result = mysqli_query($conn, $sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $name = ($row['fname'] . ' ' . $row['mname'] . ' ' . $row['lname']);
                        $role = $row['role'];
                    }
                }

                $_SESSION['user_name'] = $name;
                $_SESSION['first_time'] = $newToken;
                $_SESSION['last_time'] = time();

                if ($_SESSION['role'] == "admin") {
                    header("location:/iicshd/user/admin/home.php");
                    exit();
                } elseif ($_SESSION['role'] == "student") {
                    header("location:/iicshd/user/student/home.php");
                    exit();
                } elseif ($_SESSION['role'] == "faculty") {
                    header("location:/iicshd/user/faculty/home.php");
                    exit();
                } elseif ($_SESSION['role'] == "organizati") {
                    header("location:/iicshd/user/organization/home.php");
                    exit();
                }
            } else {
                echo "Error updating record: " . $connect->error;
            }
        }
    }
}
?>