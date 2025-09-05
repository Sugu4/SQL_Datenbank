# 🗄️ SQL Projekte – Übersicht

Dieses Repository enthält mehrere **SQL-Projekte**, die praxisnahe Szenarien modellieren und wichtige Konzepte der relationalen Datenbanken abbilden.  
Alle Projekte wurden in **MySQL** entwickelt und dokumentiert.  

---

## Projekte

### 1. Immobilien-Datenbank (`bg_gmbh`)
Ein Datenmodell zur Verwaltung von Immobilien, Kunden, Maklern und Eigentümern.  

**Funktionen:**
- Verwaltung von **Immobilien** (Straße, Hausnummer, PLZ)  
- **Makler- und Kundendaten** mit Terminen verknüpfen  
- Eigentümerverwaltung mit Referenz auf Immobilien  
- Beispiel-Queries für Joins zwischen Makler, Kunden und Immobilien  

👉 [Zum Projekt-README](./bg_gmbh/README.md)  

---

### 2. Kino-Datenbank (`kino`)
Ein umfangreiches Datenmodell für die Verwaltung eines Kinos.  

**Funktionen:**
- **Film- & Genreverwaltung** (n:m-Beziehung)  
- **Programmplanung** (Vorstellungen in Räumen)  
- **Sitzplatz- & Preiskategorien** für flexible Buchungssysteme  
- **Kunden- & Buchungen** mit Ticketverwaltung  
- **Werbung & Menüs** als Zusatz-Funktion  

👉 [Zum Projekt-README](./kino/README.md)  

---

## Lernziele
- **Datenmodellierung**: Normalisierung, PK/FK-Beziehungen, n:m-Relationen  
- **SQL-Abfragen**: SELECT, JOINs, Constraints, Insertions  
- **Praxisnähe**: Abbildung realistischer Geschäftsprozesse  
- **Dokumentation**: Jedes Projekt enthält ein README mit Tabellenübersicht & Beispiel-Queries  

---

## Verwendung
1. Projekt auswählen (z. B. `bg_gmbh` oder `kino`)  
2. Datenbank erstellen und SQL-Skript importieren:
   ```bash
   mysql -u root -p < projekt.sql
