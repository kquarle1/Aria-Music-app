DROP DATABASE IF EXISTS aria_music;

CREATE DATABASE IF NOT EXISTS aria_music;

USE aria_music;

CREATE TABLE users
(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    user_email VARCHAR(225) NOT NULL UNIQUE,
    user_password VARCHAR(225) NOT NULL
);

CREATE TABLE playlist
(
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_name VARCHAR(50) NOT NULL,
    user_id INT,
    CONSTRAINT playlist_user
		FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE artist
(
	artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_first_name VARCHAR(50) NOT NULL,
    artist_last_name VARCHAR(50)
);

CREATE TABLE album
(
	album_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
	artist_id INT,
    release_date DATE,
    CONSTRAINT album_artist
		FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE genre
(
	genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(30) NOT NULL
);

CREATE TABLE songs
(
	song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(50) NOT NULL,
    album_id INT,
    playlist_id INT,
    genre_id INT,
    composer VARCHAR(50),
    song_length TIME,
    release_date DATE,
    CONSTRAINT song_album
		FOREIGN KEY (album_id) REFERENCES album(album_id),
	CONSTRAINT song_genre
		FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
	CONSTRAINT song_playlist
		FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id)
);

CREATE TABLE liked_songs
(
	user_id INT,
    song_id INT,
    liked_song BOOLEAN DEFAULT FALSE,
   CONSTRAINT user_likes
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT like_songs
    FOREIGN KEY (song_id) REFERENCES  songs(song_id)
    
);
    
    
    
    
    