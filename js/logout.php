<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 13.05.2018
 * Time: 17:19
 */

session_start();
session_destroy();
header("Location: index.php");