<?php
    require './config.php';
    try {
        $connect = new PDO("mysql:host=$host;dbname=$db;charset=UTF8", $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        if ($connect)
            echo "Connected to the $db database successfully!<br>";
    }catch (PDOException $e) {
        echo $e->getMessage();
    }
?>