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
            echo "Overovací email bol odoslaný";
        }
        else {
            echo "chyba1 ";
            //Chybove hlasnie
        }
    }

    else {
        //Na tento mail uz existuje account
        echo "existuje ";
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
<html>
<head>
    <title>Registrácia</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./style.css"/>
</head>
<body>
</body>
</html>