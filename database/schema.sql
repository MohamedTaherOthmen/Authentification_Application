CREATE DATABASE IF NOT EXISTS TuniSights;
USE TuniSights;

CREATE TABLE Tourist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    country VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SoloTraveler (
    tourist_id INT PRIMARY KEY,  
    travel_interests TEXT,         
    budget DECIMAL(10,2) NULL,     
    travel_style ENUM('adventure', 'luxury', 'backpacker', 'cultural', 'eco') DEFAULT 'adventure',
    preferred_accommodation VARCHAR(100), 
    preferred_destinations TEXT,
    travel_frequency ENUM('occasionnel', 'frequent') DEFAULT 'occasionnel',
    preferred_language VARCHAR(50),
    special_requirements TEXT,     
    FOREIGN KEY (tourist_id) REFERENCES Tourist(id)
);

CREATE TABLE Guide (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    city VARCHAR(100) NOT NULL,
    language_spoken VARCHAR(100),
    bio TEXT,
    experience_years INT DEFAULT 0,
    profile_picture_url VARCHAR(255),
    password_hash VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Plan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    description TEXT,
    gouvernorat VARCHAR(100),
    teaser_url VARCHAR(255),
    guide_id INT NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guide_id) REFERENCES Guide(id)
);

CREATE TABLE Lieu(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(150) NOT NULL,
    description TEXT,
    type ENUM('site', 'restaurant', 'transport') NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES Plan(id)
);

CREATE TABLE Reservation(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tourist_id INT NOT NULL,
    plan_id INT NOT NULL,
    date_reservation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('en_attente', 'confirmee', 'annulee') DEFAULT 'en_attente',
    FOREIGN KEY (tourist_id) REFERENCES Tourist(id),
    FOREIGN KEY (plan_id) REFERENCES Plan(id)
);

CREATE TABLE Paiement(
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    date_paiement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    methode ENUM('paypal', 'autre') NOT NULL,
    statut ENUM('effectue', 'en_attente', 'echoue') NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(id)
);

CREATE TABLE Feedback(
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT NOT NULL,
    tourist_id INT NOT NULL,
    note INT CHECK (note BETWEEN 1 AND 5),
    commentaire TEXT,
    date_feedback TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES Plan(id),
    FOREIGN KEY (tourist_id) REFERENCES Tourist(id)
);

CREATE TABLE Recommandation(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tourist_id INT NOT NULL,
    plan_id INT NOT NULL,
    raison TEXT,
    FOREIGN KEY (tourist_id) REFERENCES Tourist(id),
    FOREIGN KEY (plan_id) REFERENCES Plan(id)
);

CREATE TABLE Message(
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_type ENUM('tourist', 'guide') NOT NULL,
    sender_id INT NOT NULL,
    receiver_type ENUM('tourist', 'guide') NOT NULL,
    receiver_id INT NOT NULL,
    contenu TEXT NOT NULL,
    date_envoi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);