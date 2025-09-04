# SQL-Lernprojekt – Immobilien-Datenbank

Dieses Repository dokumentiert meine Arbeit mit **SQL** im Rahmen meiner Weiterbildung und Lernprojekte.  
Ziel ist es, die Grundlagen von relationalen Datenbanken zu erlernen und eine kleine **Immobilien-Datenbank** zu entwickeln, die realistische Anwendungsfälle abbildet.

---

## Inhalte

Aktuell umfasst das Projekt:

- Erstellung einer Datenbank `bg_gmbh`
- Arbeiten mit Tabellen:
  - `plz` – Postleitzahlen & Orte  
  - `immobilie` – Immobilien mit Fremdschlüssel zu PLZ  
  - `makler` – Makler mit eindeutigen Telefonnummern  
- Einfügen, Löschen und Abfragen von Datensätzen
- Arbeiten mit **Primärschlüsseln**, **Fremdschlüsseln** und **Constraints** (`AUTO_INCREMENT`, `NOT NULL`, `UNIQUE`)

---

## Beispielcode

```sql
-- Datenbank anlegen und auswählen
CREATE DATABASE bg_gmbh;
USE bg_gmbh;

-- Tabelle plz anlegen
CREATE TABLE plz(
  plzID INT AUTO_INCREMENT PRIMARY KEY,
  plz VARCHAR(25),
  ort VARCHAR(255)
);

-- Daten einfügen
INSERT INTO plz(ort, plz)
VALUES("München", "80333");

-- Abfrage
SELECT * FROM plz;
```

---

## Erste Ergebnisse

Beispielausgabe nach den ersten Inserts in die Tabelle plz:

| plzID	| plz |	ort |
|---|-------|---------|
| 1 | 80333 | München |
| 2 | 45130 | Essen |
| 3 | 20144 | Hamburg |
