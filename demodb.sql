DROP DATABASE IF EXISTS bqdemo;
CREATE DATABASE bqdemo DEFAULT CHARACTER SET 'UTF8';

CREATE TABLE bqdemo.ARTIST (
	ID BIGINT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100) NOT NULL
);

CREATE TABLE bqdemo.EXHIBIT (
	ID BIGINT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100) NOT NULL,
	PLACE VARCHAR(100) NOT NULL,
	STARTS DATE NOT NULL,
	ENDS DATE NOT NULL
);

CREATE TABLE bqdemo.ARTIST_EXHIBIT (
	ARTIST_ID BIGINT NOT NULL,
	EXHIBIT_ID BIGINT NOT NULL,
	PRIMARY KEY (ARTIST_ID, EXHIBIT_ID)
);

CREATE TABLE bqdemo.PAINTING (
	ID BIGINT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100) NOT NULL,
	ARTIST_ID BIGINT NOT NULL
);

ALTER TABLE bqdemo.ARTIST_EXHIBIT
ADD FOREIGN KEY ( ARTIST_ID ) REFERENCES bqdemo.ARTIST(ID);

ALTER TABLE bqdemo.ARTIST_EXHIBIT 
ADD FOREIGN KEY ( EXHIBIT_ID ) REFERENCES bqdemo.EXHIBIT(ID);

ALTER TABLE bqdemo.PAINTING
ADD FOREIGN KEY ( ARTIST_ID ) REFERENCES bqdemo.ARTIST(ID);

INSERT INTO bqdemo.ARTIST (ID, NAME) VALUES 
	(1, 'Marc Chagall'), 
	(2, 'Pablo Picasso'), 
	(3, 'Salvador Dali'), 
	(4, 'Wassily Kandinsky'),
	(5, 'Van Gogh'),
	(6, 'Andy Warhol');

INSERT INTO bqdemo.EXHIBIT (ID, NAME, PLACE, STARTS, ENDS) VALUES 
	(1, 'CHAGALL', 'Royal Museums of Fine Arts of Belgium', '2015-02-28', '2015-06-28'),
	(2, 'Picasso Black and White', 'Solomon R. Guggenheim Museum, New York', '2012-10-05', '2013-01-23'),
	(3, 'Kandinsky Gallery', 'Solomon R. Guggenheim Museum, New York', '2015-07-01', '2016-04-03'),
	(4, 'Van Gogh: Irises and Roses', 'The Metropolitan Museum of Art, New York', '2015-05-12', '2015-08-16'),
	(5, 'On the Verge of Insanity', 'Van Gogh Museum, Amsterdam', '2016-07-15', '2016-09-25'),
	(6, 'Easy Virtue', 'Van Gogh Museum, Amsterdam', '2016-02-19', '2016-06-19'),
	(7, 'Andy Warhol: Shadows', 'Solomon R. Guggenheim Museum, Bilbao', '2016-02-26', '2016-10-02');

INSERT INTO bqdemo.ARTIST_EXHIBIT (ARTIST_ID, EXHIBIT_ID) VALUES
(1,1),
(2,2),
(4,3),
(5,4),
(5,5),
(5,6),
(6, 7);

INSERT INTO bqdemo.PAINTING (ID, NAME, ARTIST_ID) VALUES 
	(1, 'The Fiddler', 1),
	(2, 'Still-life', 1),
	(3, 'Gertrude Stein', 2),
	(4, 'Sunflowers', 5),
	(5, 'Self-portrait with Bandaged Ear', 5);

