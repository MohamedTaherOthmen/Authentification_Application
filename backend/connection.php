<?php
require './config.php';

class Connection {
    public static function connectDataBase($host, $user, $password, $db){
        $dsn = "mysql:host=$host;dbname=$db;charset=UTF8";
        $option = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION];
        try {
            return new PDO($dsn, $user, $password, $option);
        } catch (PDOException $e) {
            echo "ERROR MSG : " . $e->getMessage();
            die();
        }
    }
}

return Connection::connectDataBase($host, $user, $password, $db);
?>
