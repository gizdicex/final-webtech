<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 17:04
 */

require_once "config.php";

if(isset($_GET['login']) && isset($_GET['key'])) {

    session_start();

    $login = $_GET['login'];
    $key = $_GET['key'];

    $sql = "SELECT * FROM CONFIRM WHERE login = '$login' AND user_key = '$key'";
    $result = $conn->query($sql);

    if($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $pass = $row['password'];
        $name = $row['name'];
        $sname = $row['surname'];
        $school = $row['school'];
        $school_addr = $row['school_addr'];
        $street = $row['street'];
        $psc = $row['psc'];
        $city = $row['city'];
        $id = $row['id'];

        $sql = "SELECT * FROM USER WHERE login = '$login'";
        $result = $conn->query($sql);

        if($result->num_rows < 1) {
            $sql = "INSERT INTO USER (login,password,name,surname,type,school,school_addr,street,psc,city) VALUES ('$login','$pass','$name','$sname','basic','$school','$school_addr','$street','$psc','$city')";
            $id = $conn->insert_id;
            if ($conn->query($sql)) {
                // Do something
                $sql = "DELETE FROM CONFIRM WHERE login = '$login'";
                $_SESSION['id'] = $id;
                $_SESSION['type'] = 'basic';
                $_SESSION['logged'] = true;
                if ($conn->query($sql)) header("Location: index.php");;
            } else {
                echo "chyba1 ";
                //Chybove hlasenie
            }
        }
        else {
            echo "User already registered";
        }
    }
}