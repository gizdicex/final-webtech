<?php

require_once "config.php";
session_start();
/*
if(!isset($_SESSION['logged']) || $_SESSION['type'] != "admin"){
    header("Location: index.php");
}*/

$sql = "SELECT * FROM TRASA t LEFT JOIN USER u ON t.id_user=u.id LEFT JOIN USER_PATH up ON t.id=up.id_trasa";
$result = $conn->query($sql);

?>
<!DOCTYPE html>
<html lang="sk">

<head>
    <meta charset="utf-8">
    <link rel="icon" href="img/icon.png" sizes="16x16" type="image/png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Názov</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- W3Schools -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

</head>

<body>
<!-- Header -->
<header>
    <!-- Nav -->
    <nav id="nav" class="navbar">
        <div class="container">

            <div class="navbar-header">
                <!-- Logo -->
                <div class="navbar-brand">
                    <a href="index.html">
                        <img class="logo" src="img/logo2.png" alt="logo">
                        <img class="logo-alt" src="img/logo2.png" alt="logo">
                    </a>
                </div>
                <!-- /Logo -->

                <!-- Collapse nav button -->
                <div class="nav-collapse">
                    <span></span>
                </div>
                <!-- /Collapse nav button -->
            </div>

            <!--  Main navigation  -->
            <ul class="main-nav nav navbar-nav navbar-right">
                <li><a href="index.php">Úvod</a></li>
                <li><a href="index.php#about">Aktuality</a></li>
                <li><a href="index.php#mapa">Mapa</a></li>

                <?php
                if(isset($_SESSION['logged'])) {
                    echo "<li><a href='trening.php'>Tréning</a></li>";
                    echo "<li class='active'><a href='tabulkaTras.php'>Trasy</a>";
                    if($_SESSION['type'] == "admin") {
                        echo "<li><a href='users.php'>Užívateľia</a></li>";
                    }
                    echo "<li><a href='logout.php'>Odhlásiť</a></li>";
                }
                ?>
            </ul>
            <!-- /Main navigation -->

        </div>
    </nav>
    <!-- /Nav -->
</header>

<!-- Import Modal -->
<div id="id04" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
            <h3>Vybrať súbor</h3>
        </div>

        <form class="w3-container" enctype="multipart/form-data" method="post" action="import.php">
            <div class="w3-section">
                <input type="hidden" name="MAX_FILE_SIZE" value="30000">
                <label><b>CSV súbor</b></label>
                <input class="w3-input w3-border" type="file" id="csv" name="csv" required>
                <label><b>Delimeter</b></label>
                <input class="w3-input w3-border" type="text" name="delimeter" maxlength="1">
                <button class="w3-button w3-block w3-blue w3-section w3-padding" type="submit">Importovať</button>
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id04').style.display='none'" type="button" class="w3-button w3-red">Zrušiť</button>
        </div>

    </div>
</div>
<!-- /Import Modal -->

<!-- Table -->
<div class="container">
    <button onclick="javascript:demoFromHTML()">PDF</button>
    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Vyhľadaj užívateľa..." title="Type in a name">
    <div id="content">
    <table class="table table-striped" id="myTable">
        <thead>
        <tr>
            <th onclick="sortTable(0)"><b>Aktivnost</b></th>
            <th onclick="sortTable(1)"><b>Vzdialenost</b></th>
            <th onclick="sortTable(2)"><b>Mód</b></th>
            <?php if($_SESSION['type'] == "admin")  echo "<th onclick='sortTable(2)'><b>Uživateľ</b></th>"; ?>
        </tr>
        </thead>
        <tbody id="tab-data">
        </tbody>
    </table>
    </div>
</div>

<!-- Footer -->
<footer id="footer" class="sm-padding bg-dark">

    <!-- Container -->
    <div class="container">

        <!-- Row -->
        <div class="row">

            <div class="col-md-12">

                <!-- footer logo -->
                <div class="footer-logo">
                    <a href="index.html"><img src="img/logo2.png" alt="logo"></a>
                </div>
                <!-- /footer logo -->


                <!-- footer copyright -->
                <div class="footer-copyright">
                    <p>Copyright © 2017. All Rights Reserved. Designed by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                </div>
                <!-- /footer copyright -->

            </div>

        </div>
        <!-- /Row -->

    </div>
    <!-- /Container -->

</footer>
<!-- /Footer -->

<!-- Preloader -->
<div id="preloader">
    <div class="preloader">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- /Preloader -->

<!-- jQuery Plugins -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/modals.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/tableSort.js"></script>
<script type="text/javascript" src="js/toPDF.js"></script>
<script type="text/javascript" src="js/fillTable.js"></script>

</body>
</html>

