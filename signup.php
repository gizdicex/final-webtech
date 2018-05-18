<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 16:33
 */
require_once "config.php";
if(isset($_POST['name'])) {
    $name = $_POST['name'];
    $sname = $_POST['sname'];
    $mail = $_POST['email'];
    $school = $_POST['school'];
    $school_addr = $_POST['school_addr'];
    $street = $_POST['street'];
    $psc = $_POST['psc'];
    $city = $_POST['city'];
    $pass = hash('sha256', $_POST['pass']);
    $key = md5($mail.date("H:i:s"));
    $sql = "SELECT id FROM USER WHERE login = '$mail'";
    $result = $conn->query($sql);
    //Ak neexistuje user s danym emailom
    if($result->num_rows < 1) {
        //Vytvor noveho USERA
        $sql = "INSERT INTO CONFIRM (login,password,name,surname,user_key,school,school_addr,street,psc,city) VALUES ('$mail','$pass','$name','$sname','$key','$school','$school_addr','$street','$psc','$city')";
        if ($conn->query($sql)) {
            sendMail($mail, $key);
            $msg = "Overovací email bol odoslaný";
            $submsg = "Pre návrat na hlavnú stránku stlačte tlačidlo nižšie";
        }
        else {
            echo "chyba1 ";
            //Chybove hlasnie
        }
    }
    else {
        //Na tento mail uz existuje account
        $msg = "Zadaný email sa v databáze už nachádza";
        $submsg = "Pre návrat na hlavnú stránku stlačte tlačidlo nižšie";
    }
}
function sendMail($email, $userKey) {
    $link = "http://147.175.98.179/cviko2/Final/final-webtech/confirm.php?login=".$email."&key=".$userKey;
    $headers = "From: Final Project <project@example.com>\r\n";
    $headers .= "Reply-To: project@example.com\r\n";
    $headers .= "Content-Type: text/html;\r\n";
    $body = '<a href="'.$link.'">Confirm your email</a>';
    if(!mail($email, "Confirmation mail", $body, $headers)) echo "mailerror";
}
?>

<!DOCTYPE html>
<html lang="sk">

<head>
    <meta charset="utf-8">
    <link rel="icon" href="img/icon.png" sizes="16x16" type="image/png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Registrácia</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- W3Schools -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

</head>

<body>
<!-- Header -->
<header id="home">
    <!-- Background Image -->
    <div class="bg-img" style="background-image: url('./img/background3.jpg');">
        <div class="overlay"></div>
    </div>
    <!-- /Background Image -->

    <!-- home wrapper -->
    <div class="home-wrapper">
        <div class="container">
            <div class="row">

                <!-- home content -->
                <div class="col-md-10 col-md-offset-1">
                    <div class="home-content">
                        <h1 class="white-text"><?= $msg ?></h1>
                        <p class="white-text"><?= $submsg ?></p>
                        <a id="btn-link" href="index.php" class='main-btn' onclick='showReg()' >Návrat na hlavnú stránku</a>
                        <!--button href="index.php" class='white-btn' onclick='showReg()' >Opätovné odoslanie emailu</button-->
                    </div>
                </div>
                <!-- /home content -->

            </div>
        </div>
    </div>
    <!-- /home wrapper -->

</header>
<!-- /Header -->

<!-- Preloader -->
<div id="preloader">
    <div class="preloader">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- /Preloader -->

<!-- jQuery Plugins -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>

</body>

</html>
