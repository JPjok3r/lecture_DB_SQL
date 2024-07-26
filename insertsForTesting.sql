-- Insert Countries
INSERT INTO Countries (name) VALUES
('United States'),
('United Kingdom'),
('France'),
('Japan'),
('Canada'),
('Germany'),
('Australia'),
('India');

-- Insert Genres
INSERT INTO Genres (name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Science Fiction'),
('Horror'),
('Romance'),
('Thriller'),
('Animation');

-- Insert Files (for posters and avatars)
INSERT INTO Files (file_name, mime_type, key, url, is_public) VALUES
('poster1.jpg', 'image/jpeg', 'posters/poster1.jpg', 'https://example.com/posters/poster1.jpg', true),
('poster2.jpg', 'image/jpeg', 'posters/poster2.jpg', 'https://example.com/posters/poster2.jpg', true),
('avatar1.png', 'image/png', 'avatars/avatar1.png', 'https://example.com/avatars/avatar1.png', true),
('poster3.jpg', 'image/jpeg', 'posters/poster3.jpg', 'https://example.com/posters/poster3.jpg', true),
('poster4.jpg', 'image/jpeg', 'posters/poster4.jpg', 'https://example.com/posters/poster4.jpg', true),
('poster5.jpg', 'image/jpeg', 'posters/poster5.jpg', 'https://example.com/posters/poster5.jpg', true),
('avatar2.png', 'image/png', 'avatars/avatar2.png', 'https://example.com/avatars/avatar2.png', true),
('avatar3.png', 'image/png', 'avatars/avatar3.png', 'https://example.com/avatars/avatar3.png', true);

-- Insert Users
INSERT INTO Users (username, first_name, last_name, email, password, avatar_id) VALUES
('johndoe', 'John', 'Doe', 'john@example.com', 'hashedpassword1', 3),
('janedoe', 'Jane', 'Doe', 'jane@example.com', 'hashedpassword2', NULL),
('bobsmith', 'Bob', 'Smith', 'bob@example.com', 'hashedpassword3', 7),
('alicejones', 'Alice', 'Jones', 'alice@example.com', 'hashedpassword4', 8);

-- Insert Movies
INSERT INTO Movies (title, description, budget, release_date, duration, poster_id, country_id) VALUES
('The Great Adventure', 'An epic journey across the world', 100000000, '2023-05-15', '02:30:00', 1, 1),
('City Lights', 'A romantic comedy set in New York', 50000000, '2022-12-01', '01:45:00', 2, 1),
('Eternal Sunshine', 'A mind-bending romance', 20000000, '2004-03-19', '01:48:00', 4, 1),
('Inception', 'A heist within dreams', 160000000, '2010-07-16', '02:28:00', 5, 1),
('Amélie', 'A whimsical Parisian tale', 10000000, '2001-04-25', '02:02:00', 6, 3),
('The Matrix', 'A sci-fi action classic', 63000000, '1999-03-31', '02:16:00', NULL, 1),
('Spirited Away', 'An animated masterpiece', 19000000, '2001-07-20', '02:05:00', NULL, 4);

-- Insert People
INSERT INTO People (first_name, last_name, biography, date_of_birth, gender, country_id) VALUES
('Tom', 'Hanks', 'Famous American actor', '1956-07-09', 'male', 1),
('Scarlett', 'Johansson', 'Renowned actress and singer', '1984-11-22', 'female', 1),
('Christopher', 'Nolan', 'Acclaimed British-American director', '1970-07-30', 'male', 2),
('Leonardo', 'DiCaprio', 'Award-winning American actor', '1974-11-11', 'male', 1),
('Kate', 'Winslet', 'Versatile British actress', '1975-10-05', 'female', 2),
('Hayao', 'Miyazaki', 'Legendary Japanese animator', '1941-01-05', 'male', 4),
('Keanu', 'Reeves', 'Canadian actor known for The Matrix', '1964-09-02', 'male', 5),
('Audrey', 'Tautou', 'French actress famous for Amélie', '1976-08-09', 'female', 3);

-- Insert Movie_People
INSERT INTO Movie_People (movie_id, person_id, role, character_name) VALUES
(1, 1, 'actor', 'John Smith'),
(1, 2, 'actor', 'Sarah Johnson'),
(1, 3, 'director', NULL),
(2, 2, 'actor', 'Emily Brown'),
(3, 4, 'actor', 'Joel Barish'),
(3, 5, 'actor', 'Clementine Kruczynski'),
(4, 4, 'actor', 'Cobb'),
(4, 3, 'director', NULL),
(5, 8, 'actor', 'Amélie Poulain'),
(6, 7, 'actor', 'Neo'),
(7, 6, 'director', NULL);

-- Insert Movie_Genres
INSERT INTO Movie_Genres (movie_id, genre_id) VALUES
(1, 1), -- The Great Adventure is Action
(1, 2), -- The Great Adventure is also Drama
(2, 3), -- City Lights is Comedy
(3, 2), -- Eternal Sunshine is Drama
(3, 6), -- Eternal Sunshine is also Romance
(4, 1), -- Inception is Action
(4, 7), -- Inception is also Thriller
(5, 3), -- Amélie is Comedy
(5, 6), -- Amélie is also Romance
(6, 1), -- The Matrix is Action
(6, 4), -- The Matrix is also Science Fiction
(7, 8); -- Spirited Away is Animation

-- Insert Favorites
INSERT INTO Favorites (user_id, movie_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(1, 3),
(2, 4);

-- Insert Characters
INSERT INTO Characters (name, description, role, movie_id) VALUES
('John Smith', 'The brave protagonist', 'leading', 1),
('Sarah Johnson', 'The intelligent scientist', 'supporting', 1),
('Emily Brown', 'The quirky neighbor', 'leading', 2),
('Joel Barish', 'A man trying to forget his ex-girlfriend', 'leading', 3),
('Clementine Kruczynski', 'A free-spirited woman with ever-changing hair color', 'leading', 3),
('Cobb', 'A skilled extractor in the world of dream sharing', 'leading', 4),
('Amélie Poulain', 'A shy waitress who decides to change the lives of those around her', 'leading', 5),
('Neo', 'A computer programmer who discovers the truth about reality', 'leading', 6);