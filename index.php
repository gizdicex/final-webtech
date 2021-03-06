<?php
/**
 * Created by PhpStorm.
 * User: Taiwin
 * Date: 08.05.2018
 * Time: 16:38
 */
require_once "config.php";
session_start();
?>

<!DOCTYPE html>
<html lang="sk">

<head>
    <meta charset="utf-8">
    <link rel="icon" href="img/icon.png" sizes="16x16" type="image/png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Mondy Run</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- W3Schools -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDX0hzrQujtmr0d6wVd_LimQhJ3FY6pjLM&libraries=places"></script>

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
                    <a href="index.php">
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
                <li><a href="#home">Úvod</a></li>
                <li><a href="#about">Aktuality</a></li>
                <li><a href="#mapa">Mapa</a></li>
                <?php
                if(isset($_SESSION['logged'])) {
                    $person_id = $_SESSION['id'];
                    $sql2 = "SELECT * FROM USER where USER_ID=".$person_id;
                    $result2 = $conn->query($sql2);
                    $row2 = $result2->fetch_assoc();
                    echo "<li><a href='tabulkaTras.php'>Trasy</a>";
                    echo "<li><a href='performance.php'>Osobný výkon</a>";
                    if($_SESSION['type'] == "admin") {
                        echo "<li><a href='users.php'>Užívateľia</a></li>";
                    }
                    echo "<li><a href='logout.php'>Dovidenia ".$row2['name']." ".$row2['surname']."</a></li>";
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
                        <h1 class="white-text">Vitajte na stránke<br>Mondy Run</h1>
                        <p class="white-text"> <i>„Je škoda, ak človek zostárne, bez toho aby videl krásu a silu, ktorej je jeho telo schopné.“<br>Socrates</i></p>
                        <?php
                        if(!isset($_SESSION['logged'])) {
                            echo "<button class='white-btn' onclick='showLogin()' >Prihlásenie</button>";
                            echo "<button class='main-btn' onclick='showReg()' >Registrácia</button>";
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

<!-- Login Modal -->
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
            <img src="img/avatar.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
        </div>

        <form class="w3-container" method="post" action="login.php">
            <div class="w3-section">
                <label><b>Login</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj login" name="login" required>
                <label><b>Heslo</b></label>
                <input class="w3-input w3-border" type="password" placeholder="Zadaj Heslo" name="pass" required>
                <button class="w3-button w3-block w3-blue w3-section w3-padding" type="submit">Prihlásiť</button>
                <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Zapamätať si ma
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Zrušiť</button>
        </div>

    </div>
</div>
<!-- /Login Modal -->

<!-- Registration Modal -->
<div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <form class="w3-container" method="post" action="signup.php">
            <div class="w3-section">
                <label><b>Meno</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj Meno" name="name" required>
                <label><b>Priezvisko</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj Priezvisko" name="sname" required>
                <label><b>Email</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="email" placeholder="Zadaj Email" name="email" required>
                <label><b>Heslo</b></label>
                <input class="w3-input w3-border" type="password" placeholder="Zadaj Heslo" name="pass" required>
                <label><b>Škola</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj Školu" name="school" required>
                <label><b>Adresa školy</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj adresu školy" name="school_addr" required>
                <label><b>Ulica</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj Ulicu" name="street" required>
                <label><b>PSČ</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj PSČ" name="psc" required>
                <label><b>Obec</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj Obec" name="city" required>
                <button class="w3-button w3-block w3-blue w3-section w3-padding" type="submit">Registrovať</button>
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red">Zrušiť</button>
        </div>

    </div>
</div>
<!-- /Registration Modal -->

<!-- Add Article Modal -->
<div id="id03" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
            <h3>Nový článok</h3>
        </div>

        <form class="w3-container" method="post" action="newArticle.php">
            <div class="w3-section">
                <label><b>Nadpis</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Zadaj Nadpis" name="heading" required>
                <label><b>Text</b></label>
                <textarea name="text" rows="30" cols="100" placeholder="Zadaj Text" required></textarea>
                <button class="w3-button w3-block w3-blue w3-section w3-padding" type="submit">Pridaj</button>
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-button w3-red">Zrušiť</button>
        </div>

    </div>
</div>
<!-- /Add Article Modal -->

<!-- About -->
<div id="about" class="section md-padding">

    <!-- Container -->
    <div class="container">

        <!-- Row -->
        <div class="row">

            <!-- Section header -->
            <div class="section-header text-center">
                <h2 class="title">Aktuality</h2>
            </div>
            <!-- /Section header -->
            <div class="about">

                <?php
                if(isset($_SESSION['type'])) {
                    if($_SESSION['type'] == "admin") {
                        echo "<button class='btn btn-primary' onclick='showArticle()'>Pridať článok</button>";
                    }
                }
                $sql = "SELECT * FROM ARTICLE";
                $result = $conn->query($sql);
                $articles = "";
                while($row = $result->fetch_assoc()) {
                    $article = "<div class='article'><h3>".$row['heading']."</h3><p>".$row['text']."</p></div>";
                    $articles = $article.$articles;
                }
                echo $articles;
                ?>

            </div>
        </div>
        <!-- /Row -->

    </div>
    <!-- /Container -->

</div>
<!-- /About -->

<!-- Map -->
<div id="mapa" class="section">

    <!-- Section header -->
    <div class="section-header text-center">
        <h2 class="title">Mapa</h2>
    </div>
    <!-- /Section header -->

    <form style="width: 50%; margin: auto" class="text-center" >
        <div class="form-group">
            <label for="sel1">Zadajte typ údajov pre mapu:</label>
            <select class="form-control" id="sel1" onchange="changeOption()">
                <option value="1">Bydlisko užívateľov</option>
                <option value="2">Školy, ktoré užívateľia navštevujú</option>
            </select>
        </div>
    </form>

    <div id="map"></div>

</div>
<!-- /Map -->



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
                <div class="footer-subscribe">
                    <?php if(isset($_SESSION['logged'])){
                        if($_SESSION['subscribe'] == 0) { ?>
                            <a href="subscribe.php"><img height="35px" src="img/subscribe.png" alt="Subscribe"/></a>
                        <?php } else { ?>
                            <a href="subscribe.php?un=true">Unsubscribe</a>
                        <?php }} ?>
                </div>
            </div>

        </div>
        <!-- /Row -->

    </div>
    <!-- /Container -->
    <p class="pe"><a href="dokemntacia.php">Dokumentacia</a></p>
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
<script type="text/javascript" src="js/maps.js"></script>

</body>

</html>