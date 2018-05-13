<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 16:29
 */

require_once "config.php";

if(isset($_POST['login'])){
    session_start();

    $login = htmlspecialchars($_POST['login']);
    $pass = hash('sha256', htmlspecialchars($_POST['pass']));

    $sql = "SELECT id FROM USER WHERE login = '$login' AND password = '$pass'";
    $result = $conn->query($sql);
    if ($result->num_rows == 1) {

        $row = $result->fetch_assoc();
        $id = $row['id'];
/*
        $sql = "INSERT INTO LOGIN (id_user,time,type) VALUES ('$id_u',NOW(),'$type')";
        $conn->query($sql);
*/
        //Pridel sessionID
        $_SESSION['id'] = $id;
        $_SESSION['logged'] = true;
        //unset($_SESSION['error']);
        var_dump($_SESSION);
        header("Location: index.php");
    } else {
        $_SESSION['error'] = 'Wrong login or passsword';
    }
}


?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Sign in</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./style.css"/>
</head>
<body>
<div class="login-form">
    <form action="login.php" method="post">
        <div id="err-msg" class="form-group text-center">
            <?php if(isset($_SESSION['error'])) echo $_SESSION['error'] ?>
        </div>
        <h2 class="text-center">Sign in</h2>
        <div class="form-group">
            <input type="text" name="login" class="form-control" placeholder="Username" required="required">
        </div>
        <div class="form-group">
            <input type="password" name="pass" class="form-control" placeholder="Password" required="required">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Log in</button>
        </div>
    </form>
    <p class="text-center"><a href="signup.php">Create an account</a></p>
</div>
</body>
</html>

