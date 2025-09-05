 mysql -u root
 CREATE DATABASE bg_gmbh;
 USE bg_gmbh;
 SHOW TABLES;
 CREATE TABLE plz(
    -> plzID INT AUTO_INCREMENT PRIMARY KEY,
    -> plz VARCHAR(25),
    -> ort VARCHAR(255)
    -> );
SHOW TABLES;
DESCRIBE plz;
INSERT INTO plz(ort, plz)
    -> VALUES("80333", "München");
SELECT * FROM plz;
INSERT INTO plz
    -> VALUES(3, "45130", "Essen");
select * from plz;
INSERT INTO plz(plz, ort)
    -> VALUES("20144", "Hamburg");
SELECT * FROM plz;
INSERT INTO plz
    -> VALUES(2, "45130", "Essen");
select * from plz;
 DELETE FROM plz
    -> WHERE plzID = 3;
SELECT * FROM plz;
CREATE TABLE immobilie(
    -> immo_ID INT AUTO_INCREMENT,
    -> strasse VARCHAR(255),
    -> hausnr VARCHAR(50),
    -> plz INT,
    -> name VARCHAR(255) NOT NULL,
    -> eigentuemer_id int,
    -> FOREIGN KEY(plz) REFERENCES plz(plzID),
    -> PRIMARY KEY(immo_ID)
    -> );
show tables;
DESCRIBE immobilie;
 CREATE TABLE makler(
    -> markler_ID INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(255),
    -> telefon VARCHAR(100) UNIQUE);
INSERT INTO makler(name, telefon)
    -> VALUES("Hans Müller", "089-1234-43");
SELECT warnings;
show warnings;
SELECT * from makler;
CREATE TABLE eigentuemer(
    -> eigentuemer_ID INT PRIMARY KEY,
    -> name VARCHAR(255),
    -> strasse VARCHAR(255),
    -> hausnr VARCHAR(100),
    -> klaus_peter INT,
    -> FOREIGN KEY (klaus_peter) REFERENCES plz(plzID));
DESCRIBE eigentuemer;
ALTER TABLE eigentuemer
    -> CHANGE klaus_peter plz INT;
ALTER TABLE eigentuemer
ALTER TABLE immobilie
    -> ADD FOREIGN KEY(eigentuemer_ID) REFERENCES eigentuemer(eigentuemer_ID);
DESCRIBE immobilie;
CREATE TABLE kunde(
    -> kunde_ID INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(255),
    -> strasse VARCHAR(255),
    -> hausnr VARCHAR(50),
    -> plz INT,
    -> FOREIGN KEY(PLZ) REFERENCES plz(plzID));
DESCRIBE kunde;


