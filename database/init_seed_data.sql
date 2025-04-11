-- Inserting some initial Tourist records
INSERT INTO Tourist (first_name, last_name, email, phone_number, country, password_hash)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'USA', 'hashed_password_123'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'UK', 'hashed_password_456'),
('Ahmed', 'Ali', 'ahmed.ali@example.com', '345-678-9012', 'Tunisia', 'hashed_password_789');

-- Inserting some initial SoloTraveler records
INSERT INTO SoloTraveler (tourist_id, travel_interests, budget, travel_style, preferred_accommodation, preferred_destinations, travel_frequency, preferred_language, special_requirements)
VALUES
(1, 'mountain climbing, hiking', 2000.00, 'adventure', 'hostels', 'Nepal, Switzerland', 'frequent', 'English', 'vegetarian'),
(2, 'cultural experiences, art', 3000.00, 'luxury', '5-star hotels', 'Italy, France', 'occasionnel', 'French', 'luxury services'),
(3, 'eco-tourism, sustainable travel', 1500.00, 'eco', 'eco-lodges', 'Morocco, Kenya', 'frequent', 'Arabic', 'accessible facilities');

-- Inserting some initial Guide records
INSERT INTO Guide (first_name, last_name, email, phone_number, city, language_spoken, bio, experience_years, profile_picture_url, password_hash, status)
VALUES
('Sara', 'Ben Ali', 'sara.benali@example.com', '456-789-0123', 'Tunis', 'Arabic, French', 'Expert in Tunisian history and culture.', 5, 'http://example.com/profile_pic_sara.jpg', 'hashed_password_101', 'active'),
('Rami', 'Jaziri', 'rami.jaziri@example.com', '567-890-1234', 'Sousse', 'Arabic, English', 'Passionate about outdoor adventures and eco-tourism.', 3, 'http://example.com/profile_pic_rami.jpg', 'hashed_password_202', 'active');

-- Inserting some initial Plan records
INSERT INTO Plan (titre, description, gouvernorat, teaser_url, guide_id)
VALUES
('Tunisia Cultural Tour', 'A journey through Tunisia\'s rich cultural heritage.', 'Tunis', 'http://example.com/teaser_tunisia_cultural_tour', 1),
('Desert Adventure', 'Explore the Sahara Desert with a professional guide.', 'Kebili', 'http://example.com/teaser_desert_adventure', 2);

-- Inserting some initial Lieu records
INSERT INTO Lieu (nom, description, type, plan_id)
VALUES
('Bardo Museum', 'Museum showcasing Tunisia\'s history and artifacts.', 'site', 1),
('Matmata', 'Traditional troglodyte dwellings and desert landscape.', 'site', 2),
('Le Gouter', 'A popular Tunisian restaurant.', 'restaurant', 1);

-- Inserting some initial Reservation records
INSERT INTO Reservation (tourist_id, plan_id, status)
VALUES
(1, 1, 'confirmee'),
(2, 2, 'en_attente');

-- Inserting some initial Paiement records
INSERT INTO Paiement (reservation_id, montant, methode, statut)
VALUES
(1, 1500.00, 'paypal', 'effectue'),
(2, 2000.00, 'paypal', 'en_attente');

-- Inserting some initial Feedback records
INSERT INTO Feedback (plan_id, tourist_id, note, commentaire)
VALUES
(1, 1, 5, 'Excellent cultural experience, highly recommended!'),
(2, 2, 4, 'Great adventure, but some improvements needed in logistics.');

-- Inserting some initial Recommandation records
INSERT INTO Recommandation (tourist_id, plan_id, raison)
VALUES
(1, 2, 'A great experience for those seeking adventure in the desert.'),
(2, 1, 'A perfect cultural trip for art and history lovers.');

-- Inserting some initial Message records
INSERT INTO Message (sender_type, sender_id, receiver_type, receiver_id, contenu)
VALUES
('tourist', 1, 'guide', 1, 'I\'m interested in learning more about the Tunisia Cultural Tour.'),
('guide', 1, 'tourist', 2, 'Thank you for your interest. Let me know if you need more details.');
