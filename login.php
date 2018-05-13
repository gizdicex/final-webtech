<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 16:29
 */

require_once "config.php";

if(isset($_POST['login'])){
    session_start();

    $login = htmlspecialchars($_POST['login']);
    $pass = hash('sha256', htmlspecialchars($_POST['pass']));

    $sql = "SELECT id,type FROM USER WHERE login = '$login' AND password = '$pass'";
    $result = $conn->query($sql);
    if ($result->num_rows == 1) {

        $row = $result->fetch_assoc();
        $id = $row['id'];
        $type = $row['type'];
/*
        $sql = "INSERT INTO LOGIN (id_user,time,type) VALUES ('$id_u',NOW(),'$type')";
        $conn->query($sql);
*/
        //Pridel sessionID
        $_SESSION['id'] = $id;
        $_SESSION['type'] = $type;
        $_SESSION['logged'] = true;
        //unset($_SESSION['error']);
        var_dump($_SESSION);
        header("Location: index.php");
    } else {
        //$_SESSION['error'] = 'Wrong login or passsword';
        header("Location: index.php");
    }
}
