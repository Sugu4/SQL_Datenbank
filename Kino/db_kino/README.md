# 🎬 Kino-Datenbank -- SQL & Java Projekt

Dieses Projekt modelliert eine **Kino-Datenbank** mit **MySQL** und
einem **Java-Backend**. Es umfasst typische Entitäten: Filme, Genres,
Räume, Sitzplätze und deren Verwaltung. Das Projekt dient als Beispiel
für **Datenbankmodellierung, JDBC-Zugriff und objektorientierte
Programmierung**.

------------------------------------------------------------------------

## Überblick

Die Datenbank und Anwendung bieten folgende Funktionsbereiche:

-   **Filmverwaltung**: Filme anlegen, suchen, ändern, löschen -- inkl.
    Titel, Länge, FSK, Inhalt, Erscheinungsdatum\
-   **Genreverwaltung**: Genres anlegen, listen, aktualisieren und
    löschen\
-   **Raumverwaltung**: Kinosäle mit Namen, 3D-Fähigkeit und Kapazität\
-   **Interaktives Konsolenmenü** für alle Verwaltungsvorgänge\
-   **Datenbankverbindung & Logik**: saubere Trennung aller Schichten\
-   **Spring Boot-Struktur** für spätere Erweiterung als Web-App

------------------------------------------------------------------------

## Projektstruktur

``` text
config/
  DBConfig.java         # Verbindungsmanagement zu MariaDB/MySQL

model/
  Film.java             # Datenmodell für Filme
  Genre.java            # Datenmodell für Genres
  Raum.java             # Datenmodell für Räume

service/
  FilmService.java      # SQL-CRUD-Methoden für Film
  GenreService.java     # SQL-CRUD-Methoden für Genre
  RaumService.java      # SQL-CRUD-Methoden für Raum
  FilmMenu.java         # Konsole: Film-Optionen
  GenreMenu.java        # Konsole: Genre-Optionen
  RaumMenu.java         # Konsole: Raum-Optionen
  Menu.java             # Hauptmenü für alle Bereiche

DbKinoApplication.java  # Startpunkt/Entry-Klasse
ServletInitializer.java # Spring Boot Web-Konfiguration
```

------------------------------------------------------------------------

## Tabellenstruktur (Auszug aus `Kino_2025.sql`)

### Film

  Spalte              Typ            Beschreibung
  ------------------- -------------- ------------------------
  film_id (PK)        BIGINT         Eindeutige ID
  titel               VARCHAR(255)   Filmtitel
  dauer               INT            Laufzeit (Minuten)
  fsk_freigabe        INT            Altersfreigabe
  inhalt              MEDIUMTEXT     Zusammenfassung
  erscheinungsdatum   DATE           Veröffentlichungsdatum

### Genre

  Spalte         Typ
  -------------- --------------
  genre_id(PK)   BIGINT
  genre          VARCHAR(100)

### Raum

  Spalte        Typ
  ------------- --------------
  raum_id(PK)   BIGINT
  name          VARCHAR(255)
  3d            BOOLEAN
  kapazitaet    INT

------------------------------------------------------------------------

## ER-Diagramm

![ER-Diagramm](Kino_Datenbank_ERD.png)

------------------------------------------------------------------------

## Beispiel: Konsolenmenü

``` text
Bitte Option wählen:
1: Film
2: Genre
3: Raum
-1: EXIT
```

### Aktionen pro Bereich

-   **Film**
    -   Filme anzeigen\
    -   Film anhand ID suchen\
    -   Film anlegen\
    -   Film aktualisieren\
    -   Film löschen
-   **Genre/Raum**
    -   Gleiche CRUD-Funktionen wie bei Film

Alle Methoden verwenden **Service-Klassen**, die per SQL direkt auf die
Datenbank zugreifen.

------------------------------------------------------------------------

## Verwendung

1.  **Datenbank in MySQL/MariaDB laden**

    ``` bash
    mysql -u root -p < Kino_2025.sql
    ```

2.  **Java-Anwendung starten** (IDE, Konsole)

3.  Durch das Konsolenmenü navigieren und Einträge verwalten

------------------------------------------------------------------------

## Erweiterungsmöglichkeiten

-   Neue Bereiche wie **Kunden, Buchungen oder Werbung** leicht
    erweiterbar\
-   **REST-Schnittstelle oder Weboberfläche** via Spring Boot möglich\
-   **Datenbankverbindungsdaten** zentral in `DBConfig.java`
    konfigurierbar

------------------------------------------------------------------------

## Hinweise

-   Alle SQL-Tabellen und deren Beziehungen sind in **Kino_2025.sql**
    dokumentiert\
-   Konsolenmenüs sorgen für **klare Bedienung & Testbarkeit**\
-   Projekt ist für **spätere Erweiterungen (Web, REST,
    Authentifizierung)** vorbereitet

------------------------------------------------------------------------

Projektstand: Java-Dateien und Datenbankstrukturen gemäß letzter
Version.\
Weitere Details siehe **Kino_2025.sql**.
