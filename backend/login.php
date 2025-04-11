<?php 
    $connect = require './connection.php';
    if (isset($_POST['login'])){
        $email              = $_POST['email'];
        $password           = $_POST['password'];
        $hashed_password    = password_hash($password, PASSWORD_DEFAULT);

        try{
            $sql = "SELECT * FROM tourist WHERE email = $email AND password_hash = $hashed_password";
            $stmt = $connect->query($sql);
            if($stmt){
                echo "User Found";
            }else{
                echo"please create account";
            }
        }catch (PDOException $e){
            echo "ERROR : " . $e->getMessage();
            die();
        }
    }
?>