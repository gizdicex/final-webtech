<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 18.05.2018
 * Time: 20:27
 */

require_once "config.php";
session_start();

if(isset($_SESSION['logged'])) {
    $id=$_SESSION['id'];
    if(isset($_GET['un'])) {
        $sql = "UPDATE USER SET subscribe=0 WHERE id='$id'";
        $_SESSION['subscribe'] = 0;
        $conn->query($sql);
    }
    else {
        $sql = "UPDATE USER SET subscribe=1 WHERE id='$id'";
        $_SESSION['subscribe'] = 1;
        $conn->query($sql);
    }
}
header("Location: index.php");

