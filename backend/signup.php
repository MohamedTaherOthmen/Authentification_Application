<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thank You!</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f9f9f9, #e0f7fa);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
        }

        .container img {
            width: 150px;
            margin-bottom: 20px;
        }

        h1 {
            color: #00796b;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .btn {
            text-decoration: none;
            background-color: #00796b;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            transition: 0.3s ease;
            font-weight: 600;
        }

        .btn:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <img src="../frontend/img/image.png" alt="Thank You Image">
            <h1>Thank You!</h1>
            <p>Your form has been submitted successfully. We appreciate your input!</p>
            <a href="../frontend/form.html" class="btn">Go Back to Form</a>
        </div>
        <br>
    </div>
</body>
</html>

<?php
require './connection.php';

if (isset($_POST['signup'])) {
    $first_name     = $_POST['first_name'];
    $last_name      = $_POST['last_name'];
    $email          = $_POST['email'];
    $password       = $_POST['password'];
    $phone_number   = $_POST['phone-number'];
    $country        = $_POST['country'];
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    $currentDateTime = date('Y-m-d H:i:s');

    try {
        $sql = "INSERT INTO tourist (first_name, last_name, email, phone_number, country, password_hash, created_at) 
                VALUES (:first_name, :last_name, :email, :phone_number, :country, :hashed_password, :currentDateTime)";
        
        $stmt = $connect->prepare($sql);

        // Bind parameters correctly
        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name', $last_name);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':phone_number', $phone_number);
        $stmt->bindParam(':country', $country);
        $stmt->bindParam(':hashed_password', $hashed_password);
        $stmt->bindParam(':currentDateTime', $currentDateTime);

        $stmt->execute();
        echo "User registered successfully!";
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
} else {
    echo "<br> Nothing Happened";
}
?>
