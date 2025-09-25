**Sammelkarten-Datenbank - ein Übungsprojekt**
 
**Projektvorstellung** 
Unsere Idee ist eine Datenbank für einen Sammelkartenbestand für Pokémonkarten. Hier soll der 
Bestand eines Sammlers oder Shops festgehalten werden. Er kann für seinen Bestand die 
gesammelten Karten und ihre Anzahl festhalten. Bei den Karten wird zwischen drei Typen 
unterschieden. Pokémonkarten, Trainerkarten und Energiekarten. Pokémon- und Trainerkarten 
kommen aus Sets, Energiekarten sind nicht Teil von neuen Sets.  
 
Auf das Spiel und die Regeln werden wir an dieser Stelle nicht eingehen, wir haben uns das 
Projekt aus der Sicht eines Sammlers vorgestellt.  

---

**Die Karten** 
Folgende Karten sind im Pokémon-Sammelkarten-Spiel vorhanden: 
 
Pokémonkarten stellen ein Pokémon dar, welches im 
Spiel eingesetzt wird und gegen das gegnerische 
Pokémon kämpft. Die Karte hat folgende Informationen: 
- einen Kartennamen 
- ob es eine Entwicklung ist 
- sein Typ 
- seine Kraftpunkte  
- eine Illustration 
- eine Fähigkeit (optional)  
- seine Attacken.  
Zusätzlich können Pokémonkarten Schwächen, 
Resistenzen und Rückzugskosten haben. Ein 
Seltenheitssymbol kennzeichnet wie wertvoll diese 
Karte ist und es hat eine Set-Nummer.  

---

Einige Pokémonkarten sind "Ex"-Karten. Diese sind 
mächtiger, haben aber auch die Zusatzregel, dass der 
Gegner sich zwei Karten nehmen darf, wenn er diese 
Karte besiegt.  

---

Trainerkarten sind Effektkarten, die zusätzlich zu 
Pokémonkarten gespielt werden können. Sie 
unterscheiden sich in drei Typen (Unterstützer, Item 
oder Ausrüstungskarte). Sie haben ebenfalls einen 
Kartennamen, eine Illustration, eine 
Effektbeschreibung, die Nummer im Set und eine 
Seltenheit.  

---

Energiekarten benötigt man im Spiel, damit 
Pokémonkarten ihre Attacken einsetzen können. Sie 
haben einen Typ, gehören aber keinem bestimmten Set 
an. Die Energiekarten sind durchnummeriert und haben 
eine Illustration.  

---

**Unser Entity-Relationship-Modell hat folgende Entitäten:** 
 
-  Bestand 
-  Set 
-  Pokémon_Karte 
-  Trainer_Karte 
-  Energie_Karte 
-  Typ 
-  Karten_Name 
-  Illustration 
-  Seltenheit 
 
Beim Erstellen des ERM’s haben wir an eine Kartensammlung gedacht. Diese wird als Bestand 
bezeichnet. Die Sammlung besteht aus Karten, aus verschiedenen Sets. Das Set ist eine 
Sammlung von Karten, die zusammen unter einem Set-Namen veröffentlicht werden.  
 
Unsere erste Idee, die Karte in einer Entität zusammenzufassen haben wir schnell wieder 
verworfen, da Pokémonkarten, Trainerkarten und Energiekarten zu unterschiedlich sind. 
 
Die restlichen Entitäten sind Informationen, die für mehrere Kartentypen gelten. Jede Pokémon-, 
sowie Trainerkarte besitzt jeweils einen Kartennamen, eine Illustration und eine Seltenheit. Mit 
Typ ist hier der Energietyp gemeint (Feuer, Wasser, Pflanze...), der sowohl den Typ des Pokémons 
beschreibt, als auch die der Energiekarten und den Attackenkosten. 

---

**Im Vergleich zum ERM erhielt unser RDM folgende neuen Tabellen:** 
 
- Bestand_Karte 
- Bestand_Energie_Karte 
- Karte 
- Fähigkeit 
- Pokédex_Beschreibung 
- Schwäche 
- Resistenz 
- Rückzugskosten 
- Ex 
- Attacken_Set 
- Attacken 
- Trainer_Typ 
- Energie_Typ_Set 
Beim Erstellen des RDM haben wir gemerkt, dass die Grundidee doch nicht so einfach ist, wie 
gedacht. Es gibt sehr viele Werte und Informationen auf den Karten, die zu vielen Tabellen 
geführt haben.  

---

**Aussicht:**  
 
Wenn man unser relationales Datenmodell in eine 
Datenbank überträgt, wäre ein Sammler in der Lage 
seine Kartensammlung festzuhalten. Er kann sehen, 
wie viele Karten er von jeder hat und kann sie nach 
verschiedenen Filtern suchen (z.B. Namen, Typ, 
Fähigkeiten). 
 
Mit einigen Erweiterungen wäre es auch möglich 
diese Datenbank für einen Shop zu nutzen. Der 
Händler kann dann ebenso seinen Bestand für Kunden 
festhalten und ihnen die Möglichkeit geben nach 
speziellen Sets, Karten, Typen usw. zu suchen. 

---
