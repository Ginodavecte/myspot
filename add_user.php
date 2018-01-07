<?php include ("../includes/database.php");?>
<?php include("../includes/functions.php");?>

<head>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='../style.css' rel="stylesheet" />
    <script src="../jquery-3.2.0.min.js"></script>

</head>

<body>
<?php
    $error = "";
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $add_name = mysqli_real_escape_string($connection, $_POST['name']);
        $add_telefoon = mysqli_real_escape_string($connection, $_POST['telefoon']);
        $add_email = mysqli_real_escape_string($connection, $_POST['email']);
        $add_username = mysqli_real_escape_string($connection, $_POST['username']);
        $add_password = mysqli_real_escape_string($connection, $_POST['password']);

        $sql = "SELECT * FROM users WHERE username = '$add_username';";
        $result = mysqli_query($connection, $sql);

        $passEncrypted = encryptPass($add_password);

        if($result->num_rows < 1){

            $sql = "INSERT INTO users (name, telefoon, email, username, password)
                    VALUES ('$add_name', '$add_telefoon','$add_email', '$add_username','$passEncrypted');";
            mysqli_query($connection, $sql);

                    echo "U heeft succesvol een nieuw user account aagemaakt!";
                    ?>

            <?php
        }else{
            $error = "De username die je gekozen hebt bestaat al.";
        }

    }
?>
    <form action="" method="post" >
    <table>
        <th>Voeg een user toe</th>
        <tr><td>Naam : </td><td><input type="text" name="name" placeholder="Jan de Vries" required></td></tr>
        <tr><td>Telefoon : </td><td><input type="number" name="telefoon" placeholder="0612345678" required></td></tr>
        <tr><td>E-mail adres : </td><td><input type="email" name="email" placeholder="jan@voorbeeld.nl" required></td></tr>
        <tr><td>Username : </td><td><input type="text" name="username" placeholder="CoolName050" required></td></tr>
        <tr><td>Password : </td><td><input type="password" name="password" required></td></tr>
        <tr><td></td><td><input type="submit" name="submitAddUser" value="Voeg Toe!"></td></tr>
        <tr><td><div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></td></tr>
    </table>
    </form>

</body>