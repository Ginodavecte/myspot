<?php include ("../includes/database.php");?>

<head>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='../style.css' rel="stylesheet" />
    <script src="../jquery-3.2.0.min.js"></script>
</head>

<body>
<?php
$verwijder_id = intval($_GET['id']);

if (is_int($verwijder_id)) {
?>
<div class="container main">
    <div class="col-md-6 center">
        <div class="panel panel-primary">
            <div class="panel-heading"><h3 class="panel-title">Succesvol user verwijderd</h3></div>
            <table class="table table-hover" id="dev-table"><br>
                <?php

                $query = "DELETE FROM users WHERE id = ". $verwijder_id ;
                $result = mysqli_query($connection, $query);
                echo "Het account is succesvol verwijderd!"."<br>";
                }
                ?>
                <br>
                <li><a href="home.php" >Ga terug naar home</a></li>
            </table>
        </div>
    </div>
</div>
</body>
