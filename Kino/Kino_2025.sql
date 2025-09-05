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
    buchung_id BIGINT,
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
    FOREIGN KEY (kunde_id) REFERENCES kunde(kunde_id),
    FOREIGN KEY (programm_id) REFERENCES programm(programm_id)
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
    ADD FOREIGN KEY (buchung_id) REFERENCES buchung(buchung_id),
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
