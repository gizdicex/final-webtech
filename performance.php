<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 13.05.2018
 * Time: 22:13
 */
require_once "config.php";
session_start();
if(!isset($_SESSION['logged'])){
    header("Location: index.php");
}
$person_id = $_SESSION['id'];
$sql = "SELECT * FROM POKROKY where USER_ID=".$person_id;
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
                    echo "<li><a href='tabulkaTras.php'>Trasy</a>";
                    echo "<li class='active'><a href='performance.php'>Osobný výkon</a>";
                    if($_SESSION['type'] == "admin") {
                        echo "<li ><a href='users.php'>Užívateľia</a></li>";
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



<!-- Table -->
<div class="container">
    <button onclick="javascript:demoFromHTML()">PDF</button>
    <div id="content">
    <table class="table table-striped" id="myTable">
        <thead>
        <tr>
            <td onclick="sortTable(0)"><b>Úsek</b></td>
            <td onclick="sortTable(1)"><b>Deň</b></td>
            <td onclick="sortTable(2)"><b>Začiatočný čas</b></td>
            <td onclick="sortTable(3)"><b>Konečný čas</b></td>
            <td onclick="sortTable(4)"><b>Začiatočná poloha</b></td>
            <td onclick="sortTable(5)"><b>Konečná poloha</b></td>
            <td onclick="sortTable(6)"><b>Hodnotenie<b></td>
            <td onclick="sortTable(7)"><b>Priemenrná rýchlosť<b></td>
        </tr>
        </thead>
        <tbody>
        <?php $km = 0; $pom = 0;
        if($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                ?>

                <tr>
                    <td><?php echo $row['km'] ?>km</td>
                    <td><?php echo $row['den'] ?></td>
                    <td><?php echo $row['zcas'] ?></td>
                    <td><?php echo $row['kcas'] ?></td>
                    <td><?php echo $row['zgps'] ?></td>
                    <td><?php echo $row['kgps'] ?></td>
                    <td><?php echo $row['hodnotenie']  ?></td>
                    <?php if (!$row['zcas']){
                        echo '<td> Nemožné </td>';
                    }
                    if ($row['zcas']) {
                        $kilometre = $row['km'];
                        $kcas = explode(":",$row['kcas']);
                        $zcas = explode(":",$row['zcas']);
                        $vysledok[0] = $kcas[0] - $zcas[0];
                        $vysledok[1] = $kcas[1] - $zcas[1];
                        $vysledok[2] = $kcas[2] - $zcas[2];
                        $hodiny = $vysledok[0] + $vysledok[1]/60 + $vysledok[2]/3600;
                        if ($hodiny == 0){echo '<td>' ."Nemožné" . '</td>';}
                        else {
                            $rychlost = $kilometre / $hodiny;
                            echo '<td>' . round($rychlost, 2) . ' km/hod' . '</td>';
                        }
                    }
                    $km += $row['km'];
                    $pom += 1;
                    ?>
                </tr>
                <?php
            }
        }
        ?>
        </tbody>
    </table>
    </div>
</div>
<p class="pe">  <?php if($pom>0){ echo "Priemerná  hodnota odbehnutých/odjazdených kilometrov na jeden tréning: " . round($km/$pom,2) ." km"; }
else echo "Zatial žiadne výkony."?>
</p>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/toPDF.js"></script>
<script type="text/javascript" src="js/modals.js"></script>
<script type="text/javascript" src="js/tableSort.js"></script>


</body>
</html>