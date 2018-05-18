<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 16:38
 */

require_once "config.php";

session_start();


if(!isset($_SESSION['logged'])) header("Location: index.php");

if(isset($_POST['start']) && isset($_POST['end'])) {

    $origin =$_POST['start']; $destination = $_POST['end']; $vzdialenost = $_POST['vzdialenost'];

    $start = $_POST['start'];
    $end = $_POST['end'];
    if (!mysqli_query($conn,"INSERT INTO TRASA (Start,End,Vzdialenost) VALUES ('$start','$end',$vzdialenost)"))
    {
        echo("Error description: " . mysqli_error($con));
    }else echo "Trasa bola úspešne pridaná";


}

if(isset($_POST['km']) ) {
    $km = $_POST['km'];
    $den = $_POST['den'];
    $zaciatok = $_POST['zaciatok'];
    $koniec = $_POST['koniec'];
    $gps_zaciatok = $_POST['gps_zaciatok'];
    $gps_koniec = $_POST['gps_koniec'];
    $hodnotenie = $_POST['hodnotenie'];
    $poznamka = $_POST['poznamka'];

    if (empty($den)) $den = "NULL"; else $den = "'$den'";
    if (empty($zaciatok)) $zaciatok = "NULL"; else $zaciatok = "'$zaciatok'";
    if (empty($koniec)) $koniec = "NULL"; else $koniec = "'$koniec'";
    if (empty($gps_zaciatok)) $gps_zaciatok = "NULL"; else $gps_zaciatok = "'$gps_zaciatok'";
    if (empty($gps_koniec)) $gps_koniec = "NULL"; else $gps_koniec = "'$gps_koniec'";
    if (empty($hodnotenie)) $hodnotenie = "NULL"; else $hodnotenie = "'$hodnotenie'";
    if (empty($poznamka)) $poznamka = "NULL"; else $poznamka = "'$poznamka'";

    $id = $_SESSION['id'];
    if (!mysqli_query($conn, "INSERT INTO POKROKY (km,den,zcas,kcas,zgps,kgps,hodnotenie,poznamka,USER_ID) VALUES ('$km',$den,$zaciatok,$koniec,$gps_zaciatok,$gps_koniec,$hodnotenie,$poznamka,'$id')")) {
        echo("Error description: " . mysqli_error($con));
    } else
        echo "Pokrok bol úspešne pridaný";

}
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
<header id="home">
    <!-- Background Image -->
    <div class="bg-img" style="background-image: url('./img/background1.jpg');">
        <div class="overlay"></div>
    </div>
    <!-- /Background Image -->

    <!-- Nav -->
    <nav id="nav" class="navbar nav-transparent">
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
                    echo "<li class='active'><a href='trening.php'>Tréning</a></li>";
                    echo "<li><a href='tabulkaTras.php'>Trasy</a>";

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

    <!-- home wrapper -->
    <div class="home-wrapper">
        <div class="container">
            <div class="row">

                <!-- home content -->
                <div class="col-md-10 col-md-offset-1">
                    <div class="home-content">
                        <h1 class="white-text">Vitajte na našej stránke</h1>
                        <p class="white-text">Popis</p>
                        <?php
                        if(isset($_SESSION['logged'])) {
                            echo "<button class='white-btn' onclick='showLogin()' class='w3-button w3-green w3-large'>Pridaj Trasu</button>";
                            echo "<button class='main-btn' onclick='showReg()' class='w3-button w3-green w3-large'>Zadaj Údaje</button>";

                        }
                        ?>
                    </div>
                </div>
                <!-- /home content -->

            </div>
        </div>
    </div>
    <!-- /home wrapper -->

</header>
<!-- /Header -->

<!-- Trasa Modal -->
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div id="map"></div>

        <form id="formular" name="theForm" class="w3-container" method="post" action="trening.php">
            Start:
            <input id="start-input" class="controls" type="text" name="start" required placeholder="Search Box">
            <br>Koniec:
            <input id="end-input" class="controls" type="text" name="end" required placeholder="Search Box">

            <?php if(isset($_SESSION['logged']))
                if($_SESSION['type'] == "admin") { ?>
                    <select name="mode" class="controls">
                        <option value="0">Privátny</option>
                        <option value="1">Štafetový</option>
                        <option value="2">Verejný</option>
                    </select>
                <?php } ?>
            <div id="output">Dlzka: </div>

            <input id="submitButton" class="w3-button w3-block w3-blue w3-section w3-padding" type="button" value="Ulož Trasu">
            <div id="hidden_form_container" style="display:none;"></div>
        </form>



        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Zrušiť</button>
        </div>

    </div>
</div>
<!-- /Trasa Modal -->


<!-- Udaje Modal -->
<div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <form class="w3-container" method="post" action="trening.php">
            <div class="w3-section">
                <label><b>Prejdené km</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj počet prejdených km" name="km" required>
                <label><b>Deň</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="date" placeholder="Zadaj deň" name="den" >
                <label><b>Začiatok tréningu</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="time" placeholder="Zadaj začiatok tréningu" name="zaciatok" >
                <label><b>Koniec tréningu</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="time" placeholder="Zadaj koniec tréningu" name="koniec"     >
                <label><b>GPS Začiatku</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj GPS" name="gps_zaciatok" >
                <label><b>GPS Konca</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj GPS" name="gps_koniec" >
                <label><b>Hodnotenie</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="number" placeholder="Zadaj hodnotenie" name="hodnotenie" required>

                <label><b>Poznámka</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj poznámky" name="poznamka" >
                <button class="w3-button w3-block w3-blue w3-section w3-padding" type="submit">Pridať</button>
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red">Zrušiť</button>
        </div>

    </div>
</div>
<!-- /Udaje Modal -->



<!-- Footer -->
<footer id="footer" class="sm-padding bg-dark">

    <!-- Container -->
    <div class="container">

        <!-- Row -->
        <div class="row">

            <div class="col-md-12">

                <!-- footer logo -->
                <div class="footer-logo">
                    <a href="index.php"><img src="img/logo2.png" alt="logo"></a>
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


<script type="text/javascript" src="js/trening.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDX0hzrQujtmr0d6wVd_LimQhJ3FY6pjLM&libraries=places&callback=initMap"></script>
<script type="text/javascript" src="js/trening.js"></script>


</body>

</html>
