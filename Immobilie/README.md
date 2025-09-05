# 🏠 Immobilien-Datenbank – SQL Projekt (`bg_gmbh`)

Dieses Projekt modelliert eine **Immobilienverwaltung** in MySQL.  
Es bildet zentrale Entitäten ab wie Immobilien, Kunden, Makler, Eigentümer und Postleitzahlen.  
Das Projekt ist ein praxisnahes Beispiel für **relationale Datenmodellierung** mit Primär- und Fremdschlüsseln.

---

## Überblick

Die Datenbank enthält folgende Hauptbereiche:

- **Postleitzahlen (plz)**: Verwaltung von PLZ und Orten  
- **Immobilien (immobilie)**: Objekte mit Adresse, PLZ, Eigentümer  
- **Makler (makler)**: Vermittler mit Namen & Telefonnummern  
- **Eigentümer (eigentuemer)**: Besitzer von Immobilien mit Adressbezug  
- **Kunden (kunde)**: Interessenten mit Adresse und PLZ  

---

## Tabellenstruktur

### PLZ
| Spalte       | Typ        | Beschreibung |
|--------------|-----------|---------------|
| plzID (PK)   | INT       | Eindeutige ID |
| plz          | VARCHAR   | Postleitzahl  |
| ort          | VARCHAR   | Ort / Stadt   |

### Immobilie
- `immo_ID (PK)`  
- `strasse`  
- `hausnr`  
- `plz (FK → plz.plzID)`  
- `name` (Bezeichnung, Pflichtfeld)  
- `eigentuemer_id (FK → eigentuemer.eigentuemer_ID)`  

### Makler
- `makler_ID (PK)`  
- `name`  
- `telefon (unique)`  

### Eigentümer
- `eigentuemer_ID (PK)`  
- `name`  
- `strasse`  
- `hausnr`  
- `plz (FK → plz.plzID)`  

### Kunde
- `kunde_ID (PK)`  
- `name`  
- `strasse`  
- `hausnr`  
- `plz (FK → plz.plzID)`  

---

## Beispiel-Querys

### 1. Alle Immobilien mit Eigentümer
```sql
SELECT i.immo_ID, i.strasse, i.hausnr, e.name AS eigentuemer
FROM immobilie i
JOIN eigentuemer e ON i.eigentuemer_id = e.eigentuemer_ID;
```

### 2. Kunden mit zugehöriger PLZ
```sql
SELECT k.kunde_ID, k.name, p.plz, p.ort
FROM kunde k
JOIN plz p ON k.plz = p.plzID;
```

### 3. Alle Makler im System
```sql
SELECT * FROM makler;
```

---

## Verwendung
1. Datenbank erstellen und SQL-Skript importieren:
   ```bash
   mysql -u root -p < immobilie.sql
   ```
2. Tabellen prüfen:
   ```sql
   SHOW TABLES;
   ```
3. Beispieldaten einfügen (PLZ, Makler, Kunden, Immobilien)  
4. Abfragen testen

---

## Nächste Schritte
- Weitere Tabellen hinzufügen, z. B. **Termine** (Verknüpfung von Makler, Kunde, Immobilie)  
- Datenbeispiele erweitern  
- ER-Diagramm für das Modell erstellen  

---

## Autor
Projekt von **Süleyman Gümüs** im Rahmen von Übungsprojekten zu **SQL & Backend**.
