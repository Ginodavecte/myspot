<?php include ("../includes/database.php");?>
<head>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href='style.css' rel="stylesheet" />
    <link href='responsive.css' rel="stylesheet" />
    <script src="../jquery-3.2.0.min.js"></script>
</head>

<?php

if(isset($_POST['submitAlterUser'])){
    $nameAlterUser = $_POST['name_user'];
    var_dump($nameAlterUser);
}
