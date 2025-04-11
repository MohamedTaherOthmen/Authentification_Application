<?php
$connect = require './connection.php';

if (isset($_POST['login'])) {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    try {
        $sql = "SELECT * FROM tourist WHERE email = :email";
        $stmt = $connect->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password_hash'])) {
            echo "✅ Welcome, " . htmlspecialchars($user['first_name']) . "!";
        } else {
            echo "❌ Incorrect email or password. Please try again.";
        }

    } catch (PDOException $e) {
        echo "🚨 ERROR: " . $e->getMessage();
        die();
    }
}
?>
