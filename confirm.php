<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 17:04
 */

require_once "config.php";

if(isset($_GET['login']) && isset($_GET['key'])) {
    $login = $_GET['login'];
    $key = $_GET['key'];

    $sql = "SELECT * FROM CONFIRM WHERE login = '$login' AND user_key = '$key'";
    $result = $conn->query($sql);

    if($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $pass = $row['password'];
        $name = $row['name'];
        $sname = $row['surname'];
        $id = $row['id'];

        $sql = "SELECT * FROM USER WHERE login = '$login'";
        $result = $conn->query($sql);

        if($result->num_rows < 1) {
            $sql = "INSERT INTO USER (login,password,name,surname,type) VALUES ('$login','$pass','$name','$sname','basic')";
            if ($conn->query($sql)) {
                // Do something
                $sql = "DELETE FROM CONFIRM WHERE id = '$id'";
                if ($conn->query($sql)) echo "SUCCESFULL!";
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