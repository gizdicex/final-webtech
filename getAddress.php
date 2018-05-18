<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 15.05.2018
 * Time: 20:25
 */
require_once "config.php";
if(isset($_GET['option'])) {
    if($_GET['option'] == 'addr') {
        $result_array = array();
        $sql = "SELECT street,psc,city FROM USER WHERE type = 'basic' LIMIT 3";
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $full_address = $row['city'].", ".$row['street'].", ".$row['psc'];
            array_push($result_array, $full_address);
        }
        echo json_encode($result_array);
    }
    else if($_GET['option'] == 'school_addr') {
        $result_array = array();
        $sql = "SELECT school_addr FROM USER WHERE type = 'basic' LIMIT 3";
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            array_push($result_array, $row['school_addr']);
        }
        echo json_encode($result_array);
    }
}