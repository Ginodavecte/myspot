<?php include("../includes/database.php");?>

<?php
    session_start();
    $error = "";
?>

<head>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='../style.css' rel="stylesheet" />
    <script src="../jquery-3.2.0.min.js"></script>

</head>

<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
    // username and password sent from form
    $password = ""; //wachtwoord
    $username = mysqli_real_escape_string($connection, $_POST['username']); //gebruikersnaam
    if(!empty($_POST['password'])) //password
        $wachtwoord = mysqli_real_escape_string($connection, $_POST['password']); //password


    $sql = "SELECT password FROM users WHERE username = '$username' LIMIT 1";
    $result = mysqli_query($connection,$sql);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    //$active = $row['active'];

    // If result matched $myusername and $mypassword, table row must be 1 row

    // Hashing the password with its hash as the salt returns the same hash
    if(empty($row['password'])){
        $password2 = "";
    }else{
        $password2 = $row['password'];
    }
    if ( hash_equals($password2 , crypt($password, $password2)) ) {
        $_SESSION['login_user'] = $username;

        header("location: home.php");
    }else {
        $error = "Your Login Name or Password is invalid";
    }
}

?>
<body>
<div class="container-fluid">
    <div class="col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                Log-in
            </div>
<form action="" method="post">
    <table class="table table-hover" id="dev-table">
        <tr>
            <td>
                Username :
            </td>
            <td>
                <input type="text" name="username" required>
            </td>
        </tr>
        <tr>
            <td>
                Password :
            </td>
            <td>
                <input type="password" name="password" required>
            </td>
        </tr>
    </table>
    <table class="table table-hover" id="login-table">
        <tr>
            <td><li> <a href="www.google.nl">Ga terug naar google</a></li></td>
            <td><input class="login" type="submit" value=" Login! "/></td>
        </tr>
    </table>
</form>

<div style="font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>

        </div>
    </div>
</div>

</body>