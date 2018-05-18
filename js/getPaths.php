<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 18.05.2018
 * Time: 17:20
 */

require_once "config.php";
session_start();

header('Content-Type: text/event-stream');
header('Cache-Control: no-cache');
if(!isset($_SESSION['logged'])) header("Location: index.php");

$sql = "SELECT * FROM TRASA t LEFT JOIN USER u ON t.id_user=u.id LEFT JOIN USER_PATH up ON t.id=up.id_trasa";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $resultArray = array();
    while ($row = $result->fetch_assoc()) {
        $resultObj = new stdClass();
        $resultObj->aktivnost = $row['aktivnost'];
        $resultObj->Vzdialenost = $row['Vzdialenost'];
        $resultObj->Mode = $row['Mode'];
        if ($_SESSION['type'] == "admin") $resultObj->login = $row['login'];
        array_push($resultArray, $resultObj);
    }
    echo "data: ".json_encode($resultArray).PHP_EOL.PHP_EOL;
    flush();
}
