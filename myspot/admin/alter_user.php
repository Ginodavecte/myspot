<?php include ("../includes/database.php");?>
<?php include ("../includes/functions.php");?>
<head>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='../style.css' rel="stylesheet" />
    <script src="../jquery-3.2.0.min.js"></script>

</head>
<body>
<div>
    Welkom bij het wijzigen van de gebruiker(user) gegevens
<?php
    $error = "";
    if(isset($_POST['submitAlterNew'])){
        $id = mysqli_real_escape_string($connection,$_POST['new_id']);
        $new_name = mysqli_real_escape_string($connection, $_POST['new_name']);
        $new_telefoon = mysqli_real_escape_string($connection, $_POST['new_telefoon']);
        $new_email = mysqli_real_escape_string($connection, $_POST['new_email']);
        $new_username = mysqli_real_escape_string($connection, $_POST['new_username']);
        $new_password = mysqli_real_escape_string($connection, $_POST['new_password']);

        $sql = "SELECT * FROM users WHERE username = '$new_username'";
        $result = mysqli_query($connection, $sql);

        $passEncrypted = encryptPass($new_password);

        if($result->num_rows <1){

            $sql = "UPDATE users SET name =  '$new_name', telefoon = '$new_telefoon',
                     email = '$new_email', username = '$new_username', password = '$passEncrypted' WHERE id = '$id'";
            $result = mysqli_query($connection,$sql);
            echo "U heeft username account gewijzigd.";
        }else{
            $error = " De username bestaat al";
        }
    }
    if(isset($_POST['submitAlterUser'])) {
        $idAlterUser = $_POST['name_user'];

        $sql = "SELECT id,name, telefoon, email, username, password FROM users WHERE id = '$idAlterUser'";
        $result = mysqli_query($connection, $sql);

        $subjects = mysqli_fetch_assoc($result);

        ?>
        <form action="alter_user.php" method="post">
    <table>
        <tr><td>ID :</td><td><input type="number" name="new_id" value="<?php echo $subjects['id']; ?>" readonly></td></tr>
        <tr><td>Nieuwe naam :</td><td><input type="text" name="new_name" placeholder="<?php echo $subjects['name'];?>"></td></tr>
        <tr><td>Nieuwe telefoon nr :</td><td><input type="number" name="new_telefoon" placeholder="<?php echo $subjects['telefoon'];?>"></td></tr>
        <tr><td>Nieuwe email :</td><td><input type="email" name="new_email" placeholder="<?php echo $subjects['email'];?>"></td></tr>
        <tr><td>Nieuwe username :</td><td><input type="text" name="new_username" placeholder="<?php echo $subjects['username'];?>"></td></tr>
        <tr><td>Nieuwe wachtwoord :</td><td><input type="password" name="new_password"></td></tr>
        <tr><td></td><td><input type="submit" name="submitAlterNew" value="Bevestig wijziging"></td></tr>
    </table>
        </form>


    <?php
    }
        $sql = "SELECT id,name,username,telefoon,email FROM users";
        $result = mysqli_query($connection, $sql);
//$selected_alterName_id = "";

        $subjects = mysqli_fetch_all($result, MYSQLI_BOTH);
//$i = 0;

        ?>
        <form action="alter_user.php" method="post">
            <table class="t">

                <tr>
                    <th>Selecteer hier van welke user u gegevens wilt wijzigen</th>
                </tr>
                <tr>
                    <td><select name="name_user">
                            <?php

                            foreach ($subjects as $subject) {
                                ?>

                                <option value="<?php echo $subject['id'];?>"><?php echo $subject['name']; ?> </option>

                                <?php
                            }//sluit foreacht

                            ?></select>
                    </td>
                    <td><input type="submit" name="submitAlterUser" value="Bevestig naam"></td>
                </tr>
                <tr><td><a href="home.php">Ga terug naar home</a></td></tr>
            </table>
        </form>
        <?php

    ?>
</div>
</body>
