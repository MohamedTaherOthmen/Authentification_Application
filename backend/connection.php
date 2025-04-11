<?php
    require './config.php';
    $dns = "mysql:host=$host;dbname=$db;charset=UTF8";
    try {
        $connect = new PDO($dns, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        /*if ($connect)
            echo "Connected to the $db database successfully!<br>";
        */
    }catch (PDOException $e) {
        echo $e->getMessage();
    }
?>