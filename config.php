<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 16:34
 */

define("HOSTNAME", "localhost");
define("USERNAME", "user");
define("PASSWORD", "159753");
define("DBNAME", "Final");


// Create connection
$conn = new mysqli(HOSTNAME, USERNAME, PASSWORD, DBNAME);
$conn->set_charset("utf8"); //treba aj nastavit utf8 hned po vytvoreni db v phpmyadmine

// Check connection
if($conn->connect_error){
    die("Connection failed" . $conn->connect_error);
}