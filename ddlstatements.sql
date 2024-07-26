-- Create custom enum types
CREATE TYPE character_role AS ENUM ('leading', 'supporting', 'background');
CREATE TYPE gender AS ENUM ('male', 'female', 'other');
CREATE TYPE movie_role AS ENUM ('actor', 'director', 'producer', 'writer', 'cameo');

-- Create Users table
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar_id INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create Files table
CREATE TABLE Files (
    id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    key VARCHAR(255) UNIQUE NOT NULL,
    url VARCHAR(255) NOT NULL,
    is_public BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create Countries table
CREATE TABLE Countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create Movies table
CREATE TABLE Movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    budget NUMERIC(15,2),
    release_date DATE,
    duration INTERVAL,
    poster_id INTEGER,
    country_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (poster_id) REFERENCES Files(id),
    FOREIGN KEY (country_id) REFERENCES Countries(id)
);

-- Create Genres table
CREATE TABLE Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create Movie_Genres table
CREATE TABLE Movie_Genres (
    movie_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(id) ON DELETE CASCADE
);

-- Create Characters table
CREATE TABLE Characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    role character_role NOT NULL,
    movie_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES Movies(id) ON DELETE CASCADE
);

-- Create People table
CREATE TABLE People (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    biography TEXT,
    date_of_birth DATE,
    gender gender,
    country_id INTEGER,
    primary_photo_id INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES Countries(id),
    FOREIGN KEY (primary_photo_id) REFERENCES Files(id)
);

-- Create Movie_People table
CREATE TABLE Movie_People (
    movie_id INTEGER,
    person_id INTEGER,
    role movie_role NOT NULL,
    character_name VARCHAR(100),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, person_id, role),
    FOREIGN KEY (movie_id) REFERENCES Movies(id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES People(id) ON DELETE CASCADE
);

-- Create Person_Photos table
CREATE TABLE Person_Photos (
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    file_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES People(id) ON DELETE CASCADE,
    FOREIGN KEY (file_id) REFERENCES Files(id) ON DELETE CASCADE
);

-- Create Favorites table
CREATE TABLE Favorites (
    user_id INTEGER,
    movie_id INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movies(id) ON DELETE CASCADE
);

-- Add foreign key constraint for avatar in Users table
ALTER TABLE Users
ADD CONSTRAINT fk_user_avatar
FOREIGN KEY (avatar_id) REFERENCES Files(id);

-- Create indexes for foreign keys and frequently queried columns
CREATE INDEX idx_users_username ON Users(username);
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_files_key ON Files(key);
CREATE INDEX idx_movies_title ON Movies(title);
CREATE INDEX idx_movies_release_date ON Movies(release_date);
CREATE INDEX idx_people_name ON People(last_name, first_name);
CREATE INDEX idx_movie_people_role ON Movie_People(role);
CREATE INDEX idx_favorites_user_id ON Favorites(user_id);
CREATE INDEX idx_favorites_movie_id ON Favorites(movie_id);