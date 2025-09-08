DROP DATABASE IF EXISTS kino_2025;
CREATE DATABASE kino_2025;
USE kino_2025;

CREATE TABLE film(
    film_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    dauer INT NOT NULL,
    fsk_freigabe INT,
    inhalt MEDIUMTEXT,
    erscheinungsdatum DATE
);

CREATE TABLE genre(
    genre_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(100) NOT NULL
);

CREATE TABLE film_genre(
    film_genre_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    film_id BIGINT NOT NULL,
    genre_id BIGINT NOT NULL,
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE programm(
    programm_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    film_id BIGINT NOT NULL,
    raum_id BIGINT NOT NULL,
    datum TIMESTAMP NOT NULL
);

CREATE TABLE raum(
    raum_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    3d BOOLEAN DEFAULT 0,
    kapazitaet INT NOT NULL
);

CREATE TABLE sitzplatz(
    sitzplatz_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    reihe INT NOT NULL,
    nummer INT NOT NULL,
    preis_kategorie_id VARCHAR(26),
    raum_id BIGINT,
    FOREIGN KEY (raum_id) REFERENCES raum(raum_id)
);

CREATE TABLE kunde(
    kunde_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255),
    geburtstag DATE
);

CREATE TABLE preis_kategorie(
    preis_kategorie_id VARCHAR(26) PRIMARY KEY,
    preis FLOAT NOT NULL
);

CREATE TABLE buchung(
    buchung_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    kunde_id BIGINT NOT NULL,
    programm_id BIGINT NOT NULL,
    datum TIMESTAMP,
    sitzplatz_id BIGINT NOT NULL,
    FOREIGN KEY (kunde_id) REFERENCES kunde(kunde_id),
    FOREIGN KEY (programm_id) REFERENCES programm(programm_id),
    FOREIGN KEY (sitzplatz_id) REFERENCES sitzplatz(sitzplatz_id)
);

CREATE TABLE werbung(
    werbung_id BIGINT AUTO_INCREMENT,
    slogan VARCHAR(255),
    film_id BIGINT,
    menu_id BIGINT,
    start_zeitpunkt TIMESTAMP,
    end_zeitpunkt TIMESTAMP,
    PRIMARY KEY (werbung_id)
);

CREATE TABLE menu(
    menu_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    preis FLOAT NOT NULL
);



ALTER TABLE programm
    ADD FOREIGN KEY (film_id) REFERENCES film(film_id),
    ADD FOREIGN KEY (raum_id) REFERENCES raum(raum_id);

ALTER TABLE sitzplatz
    ADD FOREIGN KEY (preis_kategorie_id) REFERENCES preis_kategorie(preis_kategorie_id);

ALTER TABLE werbung
    ADD FOREIGN KEY (film_id) REFERENCES film(film_id),
    ADD FOREIGN KEY (menu_id) REFERENCES menu(menu_id);

INSERT INTO film (title, dauer, fsk_freigabe, erscheinungsdatum, inhalt)
VALUES
("Disney's Hercules", 93, 0, "1997-11-20", "Er ist das Kind von Zeus und der menschlichen Hera,
wodurch er die Kraft eines Gottes und die Schwächen eines Menschen besitzt."),
("Black Swan", 108, 16, "2011-01-20", "Black Swan ist ein Psychothriller des Regisseurs Darren Aronofsky
über die Ballerina Nina (Natalie Portman), die in Tschaikowskis"),
("Bang Boom Bang", 110, 12, "1999-08-26", "Bang Boom Bang Ein todsicheres Ding ist eine deutsche Gaunerkomödie
von Regisseur Peter Thorwarth aus dem Jahr 1999 über den Kleinkriminellen Keek, der nach einem Bankraub
die Beute seines Komplizen Kalle verspielt."),
("Revolver", 111, 16, "2005-09-22", "Revolver ist ein britisch-französischer Thriller von Guy Ritchie aus dem Jahr 2005."),
("Zurueck in die Zukunft", 116, 12, "1985-07-03", "Zurück in die Zukunft (Originaltitel: Back to the Future) ist ein US-amerikanischer Science-Fiction-Film
aus dem Jahr 1985 von Robert Zemeckis mit Michael J. Fox und Christopher Lloyd in den Hauptrollen."),
("Angst und Schreken in Las Vegas", 118, 16, "1998-09-24", "Fear and Loathing in Las Vegas (deutscher Titel: Angst und Schrecken in Las Vegas) ist ein
US-amerikanischer Spielfilm von Terry Gilliam aus dem Jahr 1998 nach dem gleichnamigen Roman von Hunter S. Thompson.")
;


INSERT INTO genre (genre)
VALUES
("Drama"),
("Fantasy"),
("Thriller"),
("Horror"),
("Komödie"),
("Action"),
("Science-Fiction"),
("Abenteuer"),
("Animation"),
("Familie"),
("Musical"),
("Romantik"),
("Krimi"),
("Mystery"),
("Dokumentation"),
("Biografie"),
("Historie"),
("Sport"),
("Western");


INSERT INTO `film_genre` (`film_genre_id`, `film_id`, `genre_id`) 
VALUES
(NULL, '1', '8'),
(NULL, '1', '9'),
(NULL, '1', '5'),
(NULL, '1', '2'),
(NULL, '1', '11'),
(NULL, '1', '12'),
(NULL, '1', '6'),
(NULL, '2', '1'),
(NULL, '2', '3'),
(NULL, '3', '6'),
(NULL, '3', '5'),
(NULL, '3', '13'),
(NULL, '3', '1'),
(NULL, '3', '3'),
(NULL, '4', '1'),
(NULL, '4', '14'),
(NULL, '4', '13'),
(NULL, '4', '3'),
(NULL, '5', '8'),
(NULL, '5', '5'),
(NULL, '5', '7'),
(NULL, '6', '8'),
(NULL, '6', '5'),
(NULL, '6', '1');

INSERT INTO raum (name, 3d, kapazitaet)
VALUES
("KINO 1", 0, 200),
("KINO 2", 0, 150),
("KINO 3", 0, 170),
("KINO 4", 0, 90),
("KINO 5", 1, 120);

INSERT INTO preis_kategorie (preis_kategorie_id, preis)
VALUES
("A", 10.00),
("B", 15.00),
("C", 18.00);

INSERT INTO sitzplatz (reihe, nummer, preis_kategorie_id, raum_id)
VALUES
(1, 1, "A", 1),
(1, 2, "A", 1),
(1, 3, "A", 1),
(1, 4, "A", 1),
(1, 5, "A", 1),
(1, 6, "A", 1),
(1, 7, "A", 1),
(1, 8, "A", 1),
(1, 9, "A", 1),
(1, 10, "A", 1),
(1, 11, "A", 1),
(1, 12, "A", 1),
(1, 13, "A", 1),
(1, 14, "A", 1),
(1, 15, "A", 1),
(1, 16, "A", 1),
(1, 17, "A", 1),
(1, 18, "A", 1),
(1, 19, "A", 1),
(1, 20, "A", 1),
(2, 1, "A", 1),
(2, 2, "A", 1),
(2, 3, "A", 1),
(2, 4, "A", 1),
(2, 5, "A", 1),
(2, 6, "A", 1),
(2, 7, "A", 1),
(2, 8, "A", 1),
(2, 9, "A", 1),
(2, 10, "A", 1),
(2, 11, "A", 1),
(2, 12, "A", 1),
(2, 13, "A", 1),
(2, 14, "A", 1),
(2, 15, "A", 1),
(2, 16, "A", 1),
(2, 17, "A", 1),
(2, 18, "A", 1),
(2, 19, "A", 1),
(2, 20, "A", 1),
(3, 1, "A", 1),
(3, 2, "A", 1),
(3, 3, "A", 1),
(3, 4, "A", 1),
(3, 5, "A", 1),
(3, 6, "A", 1),
(3, 7, "A", 1),
(3, 8, "A", 1),
(3, 9, "A", 1),
(3, 10, "A", 1),
(3, 11, "A", 1),
(3, 12, "A", 1),
(3, 13, "A", 1),
(3, 14, "A", 1),
(3, 15, "A", 1),
(3, 16, "A", 1),
(3, 17, "A", 1),
(3, 18, "A", 1),
(3, 19, "A", 1),
(3, 20, "A", 1),
(4, 1, "B", 1),
(4, 2, "B", 1),
(4, 3, "B", 1),
(4, 4, "B", 1),
(4, 5, "B", 1),
(4, 6, "B",1),
(4, 7, "B",1),
(4, 8, "B",1),
(4, 9, "B",1),
(4, 10, "B",1),
(4, 11, "B",1),
(4, 12, "B",1),
(4, 13, "B",1),
(4, 14, "B",1),
(4, 15, "B",1),
(4, 16, "B",1),
(4,17,"B",1),
(4,18,"B",1),
(4,19,"B",1),
(4,20,"B",1),
(5,1,"B",1),
(5,2,"B",1),
(5,3,"B",1),
(5,4,"B",1),
(5,5,"B",1),
(5,6,"B",1),
(5,7,"B",1),
(5,8,"B",1),
(5,9,"B",1),
(5,10,"B",1),
(5,11,"B",1),
(5,12,"B",1),
(5,13,"B",1),
(5,14,"B",1),
(5,15,"B",1),
(5,16,"B",1),
(5,17,"B",1),
(5,18,"B",1),
(5,19,"B",1),
(5,20,"B",1),
(6,1,"B",1),
(6,2,"B",1),
(6,3,"B",1),
(6,4,"B",1),
(6,5,"B",1),
(6,6,"B",1),
(6,7,"B",1),
(6,8,"B",1),
(6,9,"B",1),
(6,10,"B",1),
(6,11,"B",1),
(6,12,"B",1),
(6,13,"B",1),
(6,14,"B",1),
(6,15,"B",1),
(6,16,"B",1),
(6,17,"B",1),
(6,18,"B",1),
(6,19,"B",1),
(6,20,"B",1),
(7,1,"C",1),
(7,2,"C",1),
(7,3,"C",1),
(7,4,"C",1),
(7,5,"C",1),
(7,6,"C",1),
(7,7,"C",1),
(7,8,"C",1),
(7,9,"C",1),
(7,10,"C",1),
(7,11,"C",1),
(7,12,"C",1),
(7,13,"C",1),
(7,14,"C",1),
(7,15,"C",1),
(7,16,"C",1),
(7,17,"C",1),
(7,18,"C",1),
(7,19,"C",1),
(7,20,"C",1),
(8,1,"C",1),
(8,2,"C",1),
(8,3,"C",1),
(8,4,"C",1),
(8,5,"C",1),
(8,6,"C",1),
(8,7,"C",1),
(8,8,"C",1),
(8,9,"C",1),
(8,10,"C",1),
(8,11,"C",1),
(8,12,"C",1),
(8,13,"C",1),
(8,14,"C",1),
(8,15,"C",1),
(8,16,"C",1),
(8,17,"C",1),
(8,18,"C",1),
(8,19,"C",1),
(8,20,"C",1),
(9,1,"B",1),
(9,2,"B",1),
(9,3,"B",1),
(9,4,"B",1),
(9,5,"B",1),
(9,6,"B",1),
(9,7,"B",1),
(9,8,"B",1),
(9,9,"B",1),
(9,10,"B",1),
(9,11,"B",1),
(9,12,"B",1),
(9,13,"B",1),
(9,14,"B",1),
(9,15,"B",1),
(9,16,"B",1),
(9,17,"B",1),
(9,18,"B",1),
(9,19,"B",1),
(9,20,"B",1),
(10,1,"B",1),
(10,2,"B",1),
(10,3,"B",1),
(10,4,"B",1),
(10,5,"B",1),
(10,6,"B",1),
(10,7,"B",1),
(10,8,"B",1),
(10,9,"B",1),
(10,10,"B",1),
(10,11,"B",1),
(10,12,"B",1),
(10,13,"B",1),
(10,14,"B",1),
(10,15,"B",1),
(10,16,"B",1),
(10,17,"B",1),
(10,18,"B",1),
(10,19,"B",1),
(10,20,"B",1);

