<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 13.05.2018
 * Time: 22:58
 */

require_once "config.php";
session_start();

if($_SESSION['type'] == "admin") {

    $delimeter = $_POST['delimeter'];

    if (!($stmt = $conn->prepare("INSERT INTO USER (surname, name, login, school, school_addr, street, psc, city, password, type) VALUES (?,?,?,?,?,?,?,?,?,'basic')"))) {
        echo "Prepare failed: (" . $conn->errno . ") " . $conn->error;
    }
    /* Prepared statement, stage 2: bind and execute */
    if (!$stmt->bind_param("sssssssss", $sname,$name,$email,$school,$saddr,$street,$psc,$city,$pass)) {
        echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
    }


    //Import uploaded file to Database
    $handle = fopen($_FILES['csv']['tmp_name'], "r");
    $head = true;
    $data = array();

    $corrupted = false;


    while (($data = fgetcsv($handle, 1000, $delimeter)) !== FALSE) {
        if(!$head) {

            $sname = iconv("Windows-1250", "UTF-8", $data[1]);
            $name = iconv("Windows-1250", "UTF-8", $data[2]);
            $email = iconv("Windows-1250", "UTF-8", $data[3]);
            $school = iconv("Windows-1250", "UTF-8", $data[4]);
            $saddr = iconv("Windows-1250", "UTF-8", $data[5]);
            $street = iconv("Windows-1250", "UTF-8", $data[6]);
            $psc = iconv("Windows-1250", "UTF-8", $data[7]);
            $city = iconv("Windows-1250", "UTF-8", $data[8]);
            $pass = hash('sha256',bin2hex(random_bytes(6)));

            if (!$stmt->execute()) {
                echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
                $corrupted = true;
                break;
            }

        }
        if($head) $head = false;
    }


    fclose($handle);

    if($corrupted) print "Data importing partialy failed";
    else header("Location: users.php");

}
else echo "You do not have access to this operation";