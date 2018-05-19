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

if(isset($_SESSION['logged']) && $_SESSION['type'] == "admin"){
    $sql = "SELECT * FROM TRASA t LEFT JOIN USER u ON t.id_user=u.User_id LEFT JOIN USER_PATH up ON t.Trasa_id=up.id_trasa";
    $result = $conn->query($sql);
}
else if (isset($_SESSION['logged']) && $_SESSION['type'] == "basic"){
    $person_id = $_SESSION['id'];
    $sql = "SELECT * FROM TRASA t LEFT JOIN USER u ON t.id_user=u.User_id LEFT JOIN USER_PATH up ON t.Trasa_id=up.id_trasa WHERE t.Mode = 1 || t.Mode = 2 || $person_id = t.id_user";
    $result = $conn->query($sql);

}

if ($result->num_rows > 0) {
    $resultArray = array();
    while ($row = $result->fetch_assoc()) {
        $resultObj = new stdClass();
        $resultObj->id = $row['Trasa_id'];
        if($row['aktivnost'] == null) $row['aktivnost'] =0;
        $resultObj->aktivnost = $row['aktivnost'];
        $resultObj->start = $row['Start'];
        $resultObj->end = $row['End'];
        $resultObj->Vzdialenost = $row['Vzdialenost'];
        if ($row['Mode'] == 0) $row['Mode']= "Privátny";
        else if ($row['Mode'] == 1) $row['Mode']= "Štafetový";
        else if ($row['Mode'] == 2) $row['Mode']= "Verejný";
        $resultObj->Mode = $row['Mode'];
        if ($_SESSION['type'] == "admin") $resultObj->login = $row['login'];
        array_push($resultArray, $resultObj);
    }
    echo "data: ".json_encode($resultArray).PHP_EOL.PHP_EOL;
    flush();
}

?>

