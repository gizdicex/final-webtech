<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 13.05.2018
 * Time: 19:37
 */

require_once "config.php";
session_start();

if(isset($_POST['text']) && isset($_POST['heading'])) {
    if($_SESSION['type'] == "admin") {
        $heading = htmlspecialchars($_POST['heading']);
        $text = htmlspecialchars($_POST['text']);
/*
        $sql ="INSERT INTO ARTICLE (heading, text) VALUES ('$heading','$text')";
        if($conn->query($sql)) {
            header("Location: index.php");
        }
        else echo "Insertion of article failed";
*/
        /* Prepared statement, stage 1: prepare */
        if (!($stmt = $conn->prepare("INSERT INTO ARTICLE (heading, text) VALUES (?,?)"))) {
            echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
        }

        /* Prepared statement, stage 2: bind and execute */
        if (!$stmt->bind_param("ss", $heading, $text)) {
            echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
        }

        if (!$stmt->execute()) {
            echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
        }
        else header("Location: index.php");

    }
    else echo "You do not have access to this operation";
}