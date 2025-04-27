USE aria_music;

/*Write a query that returns the email, first name, last name, & genre of all Pop listeners.
Order by user last name in descending order.*/
SELECT DISTINCT u.user_email, u.first_name, u.last_name, g.genre_name
FROM user u
	JOIN playlist p	ON u.user_id = p.user_id
    JOIN song s ON p.playlist_id = s.playlist_id
    JOIN genre g ON s.genre_id = g.genre_id
WHERE g.genre_name = 'Pop'
ORDER BY u.last_name DESC;

/*Return all songs that have a song length longer than the average song length.
Return the song name and song length.*/
SELECT song_name, song_length
FROM song
WHERE song_length > (SELECT AVG(song_length) AS avg_song_length FROM song);

/*Write a query that returns the oldest song that is in music library.
Return the song name, album title, genre, and release date.*/
SELECT s.song_name, a.title, g.genre_name, MIN(s.release_date)
FROM song s
	JOIN album a ON s.album_id = a.album_id
    JOIN genre g ON s.genre_id = g.genre_id;

/*Write a query that shows all the users that like the songs by Arianna Grande */
SELECT u.user_id, u.first_name, u.last_name, a.artist_first_name, a.artist_last_name, l.like_song
FROM liked_songs l
JOIN song s ON l.like_song = s.song_id 
JOIN album alb ON s.album_id = alb.album_id
JOIN artist a ON alb.artist_id = a.artist_id
JOIN user u ON l.user_id = u.user_id
WHERE a.artist_first_name = 'Ariana' AND a.artist_last_name = 'Grande'
ORDER BY u.first_name;

/* All the Kpop songs that are over 3 mins display  the artist name and what album the songs are from*/
SELECT   s.song_name, s.song_length, a.artist_first_name, a.artist_last_name, al.title
FROM genre g  JOIN song s ON g.genre_id = s.genre_id
JOIN album al ON s.album_id = al.album_id
JOIN artist a ON al.artist_id = a.artist_id
WHERE s.song_length > '00:03:00' AND g.genre_name = 'K-pop'
ORDER BY a.artist_first_name, al.title;

/*Write a query if what users has liked any DEAN song */
SELECT u.user_id,u.first_name,u.last_name, a.artist_first_name, a.artist_last_name, s.song_name 
FROM  liked_songs ls
JOIN song s ON ls.like_song = s.song_id
JOIN album al ON s.album_id = al.album_id
JOIN artist a ON al.artist_id = a.artist_id
JOIN user u ON ls.user_id = u.user_id
WHERE a.artist_first_name = 'DEAN'
ORDER BY u.first_name, u.last_name;

