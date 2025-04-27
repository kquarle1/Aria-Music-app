DROP DATABASE IF EXISTS aria_music;

CREATE DATABASE IF NOT EXISTS aria_music;

USE aria_music;

CREATE TABLE user
(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    user_email VARCHAR(225) NOT NULL UNIQUE,
    user_password VARCHAR(225) NOT NULL
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
    album_title VARCHAR(225) NOT NULL,
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

CREATE TABLE playlist
(
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_name VARCHAR(50) NOT NULL,
    user_id INT,
    CONSTRAINT playlist_user
		FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE song
(
	song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(225) NOT NULL,
    album_id INT,
    playlist_id INT,
    genre_id INT,
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
	like_song BOOLEAN DEFAULT FALSE,
    CONSTRAINT liked_user
		FOREIGN KEY (user_id) REFERENCES user(user_id),
	CONSTRAINT liked_songs
		FOREIGN KEY (song_id) REFERENCES song(song_id)
);
    
INSERT INTO user (first_name, last_name, user_email, user_password)
VALUES
('Alice', 'Smith', 'alice.smith@gmail.com', 'Password123!'),
('Bob', 'Johnson', 'bob.johnson@yahoo.com', '$SecurePasssword2345'),
('Charlie', 'Russel', 'charlie.russel@icloud.com', 'Lovedogs96745#?'),
('Elphaba', 'Thropp', 'elphie.thropp@example.com', 'BlackHatQueen111!'),
('Glinda', 'Upland', 'Glinda.The_Good@example.com', 'Glinny4Prez@Emerald'),
('Randolph', 'Allan', 'Allan76@gmail.com', '526@oRXjeJ8I');

INSERT INTO artist (artist_first_name, artist_last_name)
VALUES
('Ariana', 'Grande'),
('Aaliyah', NULL),
('BTS', NULL),
('Brandy', NULL),
('Britney', 'Spears'),
('CRUSH', NULL),
('beabadoobee', NULL),
('Beyonce', NULL),
('EXO', NULL),
('Faye', 'Webster'),
('Essosa', NULL),
('Eve', NULL),
('Flo Milli', NULL),
('Frank', 'Ocean'),
('Hunnah', NULL),
('Hi Five', NULL),
('Lady', 'Gaga'),
('Lauryn', 'Hill'),
('Becky', 'G');

INSERT INTO album (album_title, artist_id, release_date)
VALUES
('eternal sunshine deluxe: brighter days ahead', 1, '2025-3-28'),
('Aaliyah', 2, '2001-07-17'),
('The Most Beautiful Moment in Life, Pt. 2', 3, '2015-11-30'),
('Full Moon', 4, '2002-03-25'),
('...Baby One More Time', 5, '1999-01-12'),
('Crush On You', 6, '2016-05-04'),
('Fake It Flowers', 7, '2020-10-16'),
('Lemonade', 8, '2016-04-23'),
('XOXO', 9, '2013-06-03'),
('Atlanta Millionaires Club', 10, '2019-05-24'),
('Essies World', 11, '2021-07-15'),
('Let There Be Eve...Ruff Ryders’ First Lady', 12, '1999-09-14'),
('Ho, Why Is You Here?', 13, '2020-06-26'),
('channel ORANGE', 14, '2012-07-10'),
('Hunnah', 15, '2021-05-07'),
('Hi-Five', 16, '1992-11-10'),
('The Fame', 17, '2008-08-19'),
('The Miseducation of Lauryn Hill', 18, '1998-08-25'),
('Play It Again', 19, '2013-07-13');

INSERT INTO genre (genre_name)
VALUES
('Pop'),
('R&B'),
('Hip Hop'),
('Soul'),
('Alternative'),
('K-Pop'),
('Jazz'),
('Bossa Nova'),
('Indie'),
('Latin'),
('Rap'),
('Funk'),
('Ballad');

INSERT INTO playlist (playlist_name, user_id)
VALUES
('Chill', 1),
('Faves', 2),
('K-Pop Faves', 3),
('Sad Girl Hours', 4),
('Latin Lounge', 5),
('Love Songs', 6);

INSERT INTO song (song_name, album_id, playlist_id, genre_id, song_length, release_date)
VALUES
/*Ariana Grande*/
('intro (end of the world)', 1, NULL, 1, '00:01:32', '2024-03-08'),
('bye', 1, 4, 1, '00:02:45', '2024-03-08'),
('dont wanna break up again', 1, 4, 1, '00:02:54', '2024-03-08'),
('Saturn Return Interlude', 1, NULL, 1, '00:00:42', '2024-03-08'),
('eternal sunshine', 1, 4, 1, '00:03:30', '2024-03-08'),
('supernatural', 1, NULL, 1, '00:02:43', '2024-03-08'),
('true story', 1, 4, 1, '00:02:43', '2024-03-08'),
('the boy is mine', 1, 4, 1, '00:02:54', '2024-03-08'),
('yes, and?', 1, NULL, 1, '00:03:35', '2024-03-08'),
('we cant be friends (wait for your love)', 1, 4, 1, '00:03:49', '2024-03-08'),
('i wish i hated you', 1, 4, 1, '00:02:34', '2024-03-08'),
('imperfect for you', 1, 1, 1, '00:03:03', '2024-03-08'),
('ordinary things', 1, 1, 1, '00:02:49', '2024-03-08'),
('intro (end of the world) [extended]', 1, NULL, 1, '00:02:41', '2024-03-08'),
('twilight zone', 1, NULL, 1, '00:03:18', '2024-03-08'),
('warm', 1, 1, 1, '00:03:22', '2024-03-08'),
('dandelion', 1, NULL, 1, '00:03:25', '2024-03-08'),
('past life', 1, NULL, 1, '00:03:36', '2024-03-08'),
('Hampstead', 1, NULL, 1, '00:03:36', '2024-03-08'),
/*Aaliyah*/
('We Need A Resolution', 2, NULL, 2, '00:04:03', '2001-04-13'),
('Loose Rap', 2, NULL, 2, '00:03:50', '2001-07-07'),
('Rock The Boat', 2, 2, 2, '00:04:35', '2001-07-07'),
('More Than A Woman', 2, 1, 2, '00:03:50', '2001-07-07'),
('Never No More', 2, 6, 2, '00:03:58', '2001-07-07'),
('I Care 4 U', 2, 4, 2, '00:04:34', '2001-07-07'),
('Extra Smooth', 2, NULL, 2, '00:03:55', '2001-07-07'),
('Read Between The Lines', 2, 6, 2, '00:04:21', '2001-07-07'),
('U Got Nerve', 2, NULL, 2, '00:03:43', '2001-07-07'),
('I Refuse', 2, NULL, 2, '00:05:57', '2001-07-07'),
('Its Whatever', 2, NULL, 2, '00:04:08', '2001-07-07'),
('I Can Be', 2, NULL, 2, '00:02:49', '2001-07-07'),
('Those Were The Days', 2, NULL, 2, '00:03:24', '2001-07-07'),
('What If', 2, NULL, 2, '00:04:20', '2001-07-07'),
('Try Again', 2, 2, 2, '00:04:45', '2000-02-22'),
 /*BTS*/
('INTRO : Never Mind', 3, NULL, 6, '00:02:18', '2015-11-30'),
('RUN' , 3, NULL, 6, '00:03:57', '2015-11-30'),
('Butterfly', 3, 4, 6, '00:04:00', '2015-11-30'),
('Whalien 52', 3, 4, 6, '00:04:04', '2015-11-30'),
('Ma City', 3, NULL, 6, '00:04:18', '2015-11-30'),
('Silver Spoon', 3, NULL, 6, '00:04:04', '2015-11-30'),
('SKIT : One night in a strange city', 3, NULL, 6, '00:04:25', '2015-11-30'),
('Autumn Leaves', 3, 4, 6, '00:04:28', '2015-11-30'),
('OUTRO : House Of Cards', 3, NULL, 6, '00:02:57','2015-11-30'),
/*Brandy*/
('B Rocka Intro', 4, NULL, 2, '00:01:20', '2002-02-25'),
('Full Moon', 4, 1, 2, '00:04:09', '2002-02-25'),
('I Thought', 4, 4, 2, '00:04:30', '2002-02-25'),
('When You Touch Me', 4, 1, 2, '00:05:43', '2002-02-25'),
('Like This', 4, 1, 2, '00:04:33', '2002-02-25'),
('All In Me', 4, NULL, 2, '00:04:00', '2002-02-25'),
('Apart', 4, 1, 2, '00:04:28', '2002-02-25'),
('Can We', 4, NULL, 2, '00:04:44', '2002-02-25'),
('What About Us?', 4, 4, 2, '00:04:13', '2002-02-25'),
('Anybody', 4, NULL, 2, '00:04:56', '2002-02-25'),
('Nothing', 4, 4, 2, '00:04:49', '2002-02-25'),
('Its Not Worth It', 4, 4, 2, '00:04:23', '2002-02-25'),
('He Is', 4, 1, 2, '00:04:21', '2002-02-25'),
('Come a Little Closer', 4, 4, 2, '00:04:32', '2002-02-25'), 
('Love Wouldnt Count Me Out', 4, 4, 2, '00:04:19', '2002-02-25'),
('Wow', 4, NULL, 2, '00:04:13', '2002-02-25'),
('Die With You', 4, NULL, 2, '00:04:32', '2002-02-25'),
('I Wanna Fall In Love', 4, 6, 2, '00:04:49', '2002-02-25'),
/*Britney Spears*/
('...Baby One More Time', 5, 2, 1, '00:03:31', '1998-09-29'),
('(You Drive Me) Crazy', 5, 2, 1, '00:03:19', '1999-01-12'),
('Sometimes', 5, 4, 1, '00:04:06', '1999-01-12'),
('Soda Pop', 5, NULL, 1, '00:03:22', '1999-01-12'),
('Born to Make You Happy', 5, 6, 1, '00:04:05', '1999-01-12'),
('From the Bottom of My Broken Heart', 5, 6, 1, '00:05:12', '1999-01-12'),
('I Will Be There', 5, 6, 1, '00:03:55', '1999-01-12'),
('I will Still Love You', 5, 6, 1, '00:04:04', '1999-01-12'),
('Thinkin About You', 5, 6, 1, '00:03:36', '1999-01-12'),
('E-Mail My Heart', 5, 6, 1, '00:03:43', '1999-01-12'),
('The Beat Goes On', 5, NULL, 1, '00:04:43', '1999-01-12'),
/* CRUSH*/
('Crush On You', 6, 1, 1, '00:03:22', '2014-04-01'),
('Sometimes', 6, 1, 1, '00:03:32', '2014-04-01'),
('Sleepness', 6, 1, 1, '00:03:14', '2014-04-01'),
('Falling In Love', 6, 1, 1, '00:03:20', '2014-04-01'),
('A Letter From You', 6, 1, 1, '00:03:13', '2014-04-01'),
/*Beabadoobee*/
('Care', 7, NULL, 5, '00:03:15', '2020-07-15'),
('Worth It', 7, NULL, 5, '00:03:15', '2020-10-16'),
('Dye It Red', 7, 4, 5, '00:03:10', '2020-10-16'),
('Back To Mars', 7, 4, 5, '00:01:31', '2020-10-16'),
('Charlie Brown', 7, NULL, 5, '00:02:33', '2020-10-16'),
('Emo Song', 7, 4, 5, '00:03:39', '2020-10-16'),
('Sorry', 7, NULL, 5, '00:03:54', '2020-10-16'),
('Further Away', 7, NULL, 5, '00:03:08', '2020-10-16'),
('Horen Sarrsion', 7, 6, 5, '00:05:36', '2020-10-16'),
('How Was Your Day?', 7, 1, 5, '00:04:32', '2020-09-28'),
('Together', 7, NULL, 5, '00:03:21', '2020-10-14'),
('Yoshimi, Forest, Magdalene', 7, NULL, 5, '00:03:25', '2020-10-16'),
/*Beyonce*/
('Pray You Catch Me', 8, 4, 1, '00:03:16', '2016-04-23'),
('Hold Up', 8, 1, 1, '00:03:41', '2016-04-23'),
('Dont Hurt Yourself', 8, NULL, 1,'00:03:54', '2016-04-23'),
('Sorry', 8, NULL, 1, '00:03:53', '2016-04-23'),
('6 Inch', 8, 2, 1, '00:04:20', '2016-04-23'),
('Daddy Lessons', 8, NULL, 1, '00:04:48', '2016-04-23'),
('Love Drought', 8, 1, 1, '00:03:57', '2016-04-23'),
('Sandcastles', 8, 4, 1, '00:03:03', '2016-04-23'),
('Forward', 8, 4, 1, '00:01:19', '2016-04-23'),
('Freedom', 8, 2, 1, '00:04:50', '2016-04-23'),
('All Night', 8, 2, 1, '00:05:22', '2016-04-23'),
('Formation', 8, NULL, 1, '00:03:26', '2016-02-06'),
/*EXO*/
('Growl', 9, 6, 6, '00:03:41', '2013-06-03'),
('Wolf', 9, 3, 6, '00:03:51', '2013-06-03'),
('XOXO (Kisses and Hugs)', 9, 6, 6, '00:03:06', '2013-06-03'),
('Lucky', 9, 6, 6, '00:03:24', '2013-06-03'),
('Black Pearl', 9, 3, 6, '00:03:07', '2013-06-03'),
("Don't Go", 9, 4, 6, '00:03:41', '2013-06-03'),
('Let Out the Beast', 9, 3, 6, '00:03:26', '2013-06-03'),
('3.6.5', 9, NULL, 6, '00:03:05', '2013-06-03'),
('Heart Attack', 9, 3, 6, '00:03:38', '2013-06-03'),
('Peter Pan', 9, NULL, 6, '00:03:55', '2013-06-03'),
('Baby', 9, 3, 6, '00:03:41', '2013-06-03'),
('My Lady', 9, 3, 6, '00:03:41', '2013-06-03'),
('Growl (EXO-K Version)', 9, 3, 6, '00:03:41', '2013-06-03'),
/* Faye Webster*/
('Room Temperature', 10, NULL, 9, '00:04:04', '2019-05-24'),
('Right Side of My Neck', 10, 4, 9, '00:02:33', '2019-05-24'),
('Hurts Me Too', 10, 4, 9, '00:03:21', '2019-05-24'),
('Pigeon', 10, 4, 9, '00:02:38', '2019-05-24'),
('Jonny', 10, 6, 9, '00:03:47', '2019-05-24'),
('Kingston', 10, 4, 9, '00:03:22', '2019-05-24'),
('Come to Atlanta', 10, NULL, 9, '00:02:33', '2019-05-24'),
('What Used to Be Mine', 10, 4, 9, '00:03:09', '2019-05-24'),
('Flowers (Feat. Father)', 10, 6, 9, '00:04:22', '2019-05-24'),
('Jonny (Reprise)', 10, NULL, 9, '00:02:00', '2019-05-24'),
/* Essosa*/
('Spin The Block', 11, NULL, 1, '00:03:30', '2024-08-16'),
('Tell Nobody', 11, NULL, 1, '00:03:25', '2024-08-16'),
('Waste My Time', 11, 2, 1, '00:03:35', '2024-08-16'),
('Only One', 11, 2, 1, '00:03:20', '2024-08-16'),
('Too Late', 1, 2, 1, '00:03:45', '2024-08-16'),
('Guilty', 11, 2, 1, '00:03:50', '2024-08-16'),
('Pluto', 11, NULL, 1, '00:03:40', '2024-08-16'),
/* Eve*/
('Eve of Destruction', 12, NULL, 1, '00:01:30', '1999-09-14'),
('What Ya Want', 12, NULL, 1, '00:03:50', '1999-09-14'),
('Gotta Man', 12, NULL, 1, '00:03:23', '1999-09-14'),
('Let Me Blow Ya Mind', 12, 1, 1, '00:03:50', '1999-09-14'),
('Love Is Blind', 12, 1, 1, '00:04:20', '1999-09-14'), 
/*Flo Milli*/
('Mood Everyday (Intro)', 13, NULL, 3, '00:00:51', '2020-07-24'),
('Beef FloMix', 13, 2, 3, '00:02:28', '2020-07-10'),
('Like That B*tch', 13, NULL, 3, '00:03:24', '2019-06-19'),
('In The Party', 13, NULL, 3, '00:02:18', '2020-07-24'),
('Pockets Bigger', 13, NULL, 3,  '00:01:47', '2020-07-24'),
('Weak', 13, NULL, 3, '00:02:37', '2020-07-10'),
('Send The Addy', 13, NULL, 3, '00:02:13', '2020-07-24'),
('19', 13, NULL, 3, '00:02:24', '2020-07-24'),
('May I', 13, NULL, 3, '00:02:44', '2020-07-24'),
('Pussycat Doll', 13, NULL, 3, '00:02:40', '2020-07-24'),
('Not Friendly', 13, NULL, 3, '00:03:55', '2020-03-31'),
('Scuse Me', 13, 2, 3, '00:02:45', '2020-07-24'),
/*Frank Ocean*/
('Start', 14, NULL, 1, '00:00:45', '2012-07-10'),
('Thinkin Bout You', 14, 6, 1, '00:03:21', '2012-04-17'),
('Fertilizer', 14, NULL, 1, '00:00:39', '2012-07-10'),
('Sierra Leone', 14, NULL, 1, '00:02:28', '2012-07-10'),
('Sweet Life', 14, NULL, 1, '00:04:22', '2012-07-06'),
('Not Just Money', 14, NULL, 1, '00:01:00', '2012-07-10'),
('Super Rich Kids', 14, NULL, 1, '00:05:04', '2012-07-10'),
('Pilot Jones', 14, NULL, 1, '00:03:04', '2012-07-10'),
('Crack Rock', 14, NULL, 1, '00:03:44', '2012-07-10'),
('Pyramids', 14, NULL, 1, '00:09:53', '2012-06-07'),
('Lost', 14, NULL, 1, '00:03:54', '2012-07-10'),
('White', 14, NULL, 1, '00:01:16', '2012-07-10'),
('Monks', 14, NULL, 1, '00:03:21', '2012-07-10'),
('Bad Religion', 14, NULL, 1, '00:02:55', '2012-07-10'),
('Pink Matter', 14, NULL, 1, '00:04:28', '2012-07-10'),
('Forrest Gump', 14, NULL, 1, '00:03:15', '2012-07-10'),
('End', 14, NULL, 1, '00:02:14', '2012-07-10'),
/*Hunnah*/
('Unloved', 15, 1, 2, '00:03:20', '2021-10-29'),
('Appreciate', 15, 1, 2, '00:03:17', '2021-10-29'),
('My Man', 15, 6, 2, '00:02:59', '2021-10-29'),
('About Me', 15, NULL, 2, '00:03:16', '2021-10-29'),
('Enough', 15, 1, 2, '00:02:24', '2021-10-29'),
('It Would Be Nice', 15, NULL, 2, '00:03:32', '2021-10-29'),
('Wanting Love', 15, 4, 2, '00:03:38', '2021-10-29'),
/* Hi-Five*/
('I Like the Way (The Kissing Game)', 16, NULL, 2, '00:04:12', '1992-11-10'),
('Just Another Girlfriend', 16, NULL, 2, '00:04:25', '1992-11-10'),
('I Can''t Wait Another Minute', 16, NULL, 2, '00:04:20', '1992-11-10'),
('Too Young', 16, NULL, 2, '00:04:15', '1992-11-10'),
('Merry-Go-Round', 16, NULL, 2, '00:04:30', '1992-11-10'),
('Ragdoll', 16, NULL, 2, '00:03:55', '1992-11-10'),
('I Know Love', 16, NULL, 2, '00:04:10', '1992-11-10'),
('The Way You Said Goodbye', 16, NULL, 2, '00:03:50', '1992-11-10'),
('Sweetheart', 16, NULL, 2, '00:04:18', '1992-11-10'),
('What Can I Say to You (To Justify My Love)', 16, NULL, 2, '00:04:40', '1992-11-10'),
/* Lady Gaga*/
('Just Dance', 17, NULL, 2, '00:04:02', '2008-08-19'),
('LoveGame', 17, NULL, 2, '00:03:36', '2008-08-19'),
('Paparazzi', 17, NULL, 2, '00:03:28', '2008-08-19'),
('Poker Face', 17, NULL, 2, '00:03:57', '2008-08-19'),
('Eh, Eh (Nothing Else I Can Say)', 17, NULL, 2, '00:02:57', '2008-08-19'),
('Beautiful, Dirty, Rich', 17, NULL, 2, '00:02:53', '2008-08-19'),
('The Fame', 17, NULL, 2, '00:03:43', '2008-08-19'),
('Money Honey', 17, NULL, 2, '00:03:09', '2008-08-19'),
('Again Again', 17, NULL, 2, '00:03:06', '2008-08-19'),
('Boys Boys Boys', 17, NULL, 2, '00:03:20', '2008-08-19'),
/*Lauryn Hill*/
('Intro (Roll Call)', 18, NULL, 1, '00:00:47', '1998-08-25'),
('Lost Ones', 18, NULL, 1, '00:05:34', '1998-08-25'),
('Ex-Factor', 18, 1, 1, '00:05:27', '1998-08-25'),
('To Zion', 18, NULL, 1, '00:06:09', '1998-08-25'),
('Doo Wop (That Thing)', 18, 2, 1, '00:05:20', '1998-08-10'),
('Superstar', 18, NULL, 1, '00:04:57', '1998-08-25'),
('Final Hour', 18, NULL, 1, '00:04:16', '1998-08-25'),
('When It Hurts So Bad', 18, NULL, 1, '00:05:42', '1998-08-25'),
('I Used to Love Him', 18, NULL, 1, '00:05:40', '1998-08-25'),
('Forgive Them Father', 18, NULL, 1, '00:05:15', '1998-08-25'),
('Every Ghetto, Every City', 18, NULL, 1, '00:05:15', '1998-08-25'),
('Nothing Even Matters', 18, 1, 1, '00:05:51', '1998-08-25'),
('Everything Is Everything', 18, NULL, 1, '00:04:53', '1998-08-25'),
('The Miseducation of Lauryn Hill', 18, NULL, 1, '00:04:17', '1998-08-25'),
('Cant Take My Eyes Off of You (I Love You Baby)', 18, NULL, 1, '00:03:42', '1998-08-25'), 
('Tell Him', 18, NULL, 1, '00:04:41', '1998-08-25'),
/*Becky G*/
('Play It Again', 19, NULL, 1, '00:03:09', '2013-07-16'),
('Cant Get Enough', 19, NULL, 1, '00:03:47', '2013-07-16'),
('Built for This', 19, NULL, 1, '00:03:09', '2013-07-16'),
('Zoomin Zoomin', 19, NULL, 1, '00:03:24', '2013-07-16'),
('Lovin What You Do', 19, 6, 1, '00:03:40', '2013-07-16');

INSERT INTO liked_songs (user_id, song_id, like_song)
VALUES
-- user 1 liked_songs
(1, 1, TRUE),
(1, 2, FALSE),
(1, 3, TRUE),
(1,4, FALSE),
(1,5, FALSE),
(1,6, TRUE),
(1,7, TRUE),
(1, 35, TRUE),  
(1, 40, TRUE),  
(1, 39, TRUE), 
(1, 36, TRUE),
-- User 2 liked_songs
(2 , 1, FALSE),
(2, 2, TRUE), 
(2, 3, TRUE),
(2, 4, TRUE),
(2, 5, FALSE),
(2, 6, FALSE),
(2, 7, FALSE),
(2, 40, TRUE),
(2, 41, TRUE),
(2, 42, TRUE),
-- user 3 liked_songs
(3, 1, TRUE),
(3, 2, TRUE),
(3,3, TRUE),
(3,4, FALSE),
(3,5, FALSE),
(3,6, TRUE),
(3,7, TRUE),
(3, 43, TRUE),
(3, 37, TRUE),
(3, 38, TRUE),
-- user 4 liked_songs
(4,1, TRUE),
(4,2, FALSE),
(4,3, FALSE),
(4,4, TRUE),
(4,5, FALSE),
(4, 6, TRUE),
(4, 7, TRUE),
(4, 20, TRUE),
(4, 21, TRUE),
-- user 5 liked_songs
(5,1, TRUE),
(5,2, TRUE),
(5,3, TRUE),
(5,4, TRUE),
(5,5, TRUE),
(5, 6, TRUE),
(5, 7, TRUE),
(5, 20, TRUE),
(5, 39, TRUE),
(5, 43, TRUE),
-- user 6 liked_songs
(6, 21, TRUE),
(6, 23, TRUE),
(6, 25, TRUE);