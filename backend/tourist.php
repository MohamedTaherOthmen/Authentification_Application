<?php
    $connect = require './connection.php';
    $sql = 'SELECT first_name, last_name FROM tourist';

    $stmt = $connect->query($sql);
    $publishers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($publishers) {
        echo 'Tourist Table : '. '<br>';
        foreach ($publishers as $publisher) {
            echo ' - ' . $publisher['first_name'] . ' ' . $publisher['last_name'] . '<br>';
        }
    }
?>