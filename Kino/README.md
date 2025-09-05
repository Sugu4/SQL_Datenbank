# 🎬 Kino Datenbank – SQL Projekt

Dieses Projekt modelliert eine **Kino-Datenbank** in MySQL.  
Es umfasst alle wichtigen Entitäten wie Filme, Genres, Räume, Sitzplätze, Kunden, Buchungen und Werbung.  
Das Projekt dient als Lern- und Übungsaufgabe für Datenbankmodellierung und SQL.

---

## Überblick

Die Datenbank enthält folgende Hauptbereiche:

- **Filmverwaltung**: Filme mit Titel, Dauer, Inhalt, FSK-Freigabe, Erscheinungsdatum  
- **Genre**: Genres für Filme, n:m-Beziehung über `film_genre`  
- **Programm**: Zuordnung von Filmen zu Räumen und Zeitpunkten  
- **Raum & Sitzplätze**: Räume mit Kapazität, 3D-Flag, Sitzplätze mit Preis-Kategorien  
- **Kunden & Buchungen**: Kundenprofile, Buchungen zu Programmen und Sitzplätzen  
- **Preis-Kategorien**: Ticketpreise nach Kategorien  
- **Werbung & Menü**: Verknüpfung von Filmen mit Menüs und Werbeslogans

---

## Tabellenstruktur

### Film
| Spalte            | Typ           | Beschreibung                  |
|-------------------|--------------|-------------------------------|
| film_id (PK)      | BIGINT       | Eindeutige ID des Films       |
| title             | VARCHAR(255) | Filmtitel                     |
| dauer             | INT          | Dauer in Minuten              |
| fsk_freigabe      | INT          | Altersfreigabe                |
| inhalt            | MEDIUMTEXT   | Beschreibung / Inhalt         |
| erscheinungsdatum | DATE         | Veröffentlichungsdatum        |

### Genre
- `genre_id (PK)`
- `genre`

### Film_Genre (n:m-Beziehung)
- `film_genre_id (PK)`
- `film_id (FK)`
- `genre_id (FK)`

### Programm
- `programm_id (PK)`
- `film_id (FK)`
- `raum_id (FK)`
- `datum` (Vorstellungszeitpunkt)

### Raum
- `raum_id (PK)`
- `name`
- `3d` (Boolean)
- `kapazitaet`

### Sitzplatz
- `sitzplatz_id (PK)`
- `reihe`, `nummer`
- `preis_kategorie_id (FK)`
- `raum_id (FK)`
- `buchung_id (FK)`

### Kunde
- `kunde_id (PK)`
- `name`, `email (unique)`, `password`, `geburtstag`

### Preis_Kategorie
- `preis_kategorie_id (PK)`
- `preis`

### Buchung
- `buchung_id (PK)`
- `kunde_id (FK)`
- `programm_id (FK)`
- `datum`

### Werbung
- `werbung_id (PK)`
- `slogan`
- `film_id (FK)`
- `menu_id (FK)`
- `start_zeitpunkt`, `end_zeitpunkt`

### Menü
- `menu_id (PK)`
- `name`
- `preis`

---

## Besonderheiten
- **n:m-Beziehung** zwischen `film` und `genre` über `film_genre`  
- **Raum → Sitzplatz**: Jeder Raum hat viele Sitzplätze  
- **Buchung** verknüpft Kunde mit Programm und Sitzplätzen  
- **Werbung** kann auf Filme oder Menüs verweisen  
- **Preis-Kategorie** ermöglicht flexible Preismodelle  

---

## Beispiel-Querys

### 1. Alle Filme mit Genre
```sql
SELECT f.title, g.genre
FROM film f
JOIN film_genre fg ON f.film_id = fg.film_id
JOIN genre g ON fg.genre_id = g.genre_id;
```

### 2. Sitzplätze und Preis-Kategorien in einem Raum
```sql
SELECT s.reihe, s.nummer, pk.preis
FROM sitzplatz s
JOIN preis_kategorie pk ON s.preis_kategorie_id = pk.preis_kategorie_id
WHERE s.raum_id = 1;
```

### 3. Buchungen eines Kunden
```sql
SELECT b.buchung_id, p.datum, f.title
FROM buchung b
JOIN programm p ON b.programm_id = p.programm_id
JOIN film f ON p.film_id = f.film_id
WHERE b.kunde_id = 1;
```

### 4. Werbung im Zeitraum
```sql
SELECT slogan, start_zeitpunkt, end_zeitpunkt
FROM werbung
WHERE start_zeitpunkt <= NOW()
  AND end_zeitpunkt >= NOW();
```

---

## Verwendung
1. Datenbank erstellen und SQL-Skript importieren:
   ```bash
   mysql -u root -p < kino.sql
   ```
2. Tabellen prüfen:
   ```sql
   SHOW TABLES;
   ```
3. Beispiel-Daten einfügen und Queries ausführen.

---

## Nächste Schritte
- Beispiel-Datensätze hinzufügen (Filme, Genres, Kunden, Buchungen)  
- Erweiterung: Rabattaktionen, Mitarbeiter, Online-Buchungssystem  
- Optional: ER-Diagramm zeichnen und ins Repo aufnehmen

---

## Autor
Projekt von **Süleyman Gümüs** im Rahmen von Übungsprojekten zu Datenbanken & Backend.
