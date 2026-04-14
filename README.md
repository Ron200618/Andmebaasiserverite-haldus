# Andmebaasiserverite-haldus
1. Primary Key (Primaarvõti

Definitsioon: Veerg või veergude kogum, mis tuvastab unikaalselt iga kirje tabelis. See ei tohi sisaldada NULL väärtuseid.
Kasutus: Kirjete unikaalseks eristamiseks ja seoste loomiseks teiste tabelitega.
Erinevus: Tabelis saab olla ainult üks primaarvõti.

CREATE TABLE Teenused (
    TeenusID INT PRIMARY KEY,
    Nimi VARCHAR(50)
);

2. Foreign Key (Välisvõti)
   
Definitsioon: Veerg, mis viitab teise tabeli primaarvõtmele.
Kasutus: Tabelitevaheliste seoste loomiseks ja referentsiaalse terviklikkuse tagamiseks.
Erinevus: Erinevalt primaarvõtmest võib välisvõtmes olla korduvaid väärtusi ja NULL-e.

CREATE TABLE Tellimused (
    TellimusID INT PRIMARY KEY,
    TeenusID INT,
    FOREIGN KEY (TeenusID) REFERENCES Teenused(TeenusID)
);


3. Unique Key (Unikaalne võti)
   
Definitsioon: Piirang, mis tagab, et kõik väärtused veerus on unikaalsed.
Kasutus: Vältimaks dubleerivaid andmeid veergudes, mis pole primaarvõtmed (nt e-mail).
Erinevus: Erinevalt primaarvõtmest lubab unikaalne võti ühte NULL väärtust.

CREATE TABLE Kasutajad (
    KasutajaID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);

5. Simple Key (Lihtvõti)
   
Definitsioon: Võti, mis koosneb ainult ühest veerust.
Kasutus: Lihtsate identifikaatorite puhul (nt ID-numbrid).
Erinevus: Erineb liitvõtmetest (Composite/Compound), mis kasutavad mitut veergu.
-- Siin on 'ID' lihtvõti

CREATE TABLE Tooted (
    ToodeID INT PRIMARY KEY,
    Nimi VARCHAR(50)
);

7. Composite Key (Liitvõti)
   
Definitsioon: Võti, mis koosneb kahest või enamast veerust, et tagada kirje unikaalsus.
Kasutus: Kui ükski veerg eraldi ei suuda kirjet unikaalselt tuvastada.
Erinevus: Koosneb mitmest veerust, kusjuures vähemalt üks neist võib olla välisvõti.

CREATE TABLE KursuseOsalus (
    OpilaneID INT,
    KursusID INT,
    PRIMARY KEY (OpilaneID, KursusID)
);


8. Compound Key (Ühendvõti)
   
Definitsioon: Liitvõtme alaliik, kus kõik võtme osad on iseseisvalt välisvõtmed teistes tabelites.
Kasutus: Mitme-mitmele seoste (Many-to-Many) tabelites.
Erinevus: Kui Composite Key võib sisaldada tavalisi veerge, siis Compound Key osad peavad olema välisvõtmed.
-- Eeldades, et Opilane ja Kursus tabelid on olemas
   
CREATE TABLE Hinded (
    OpilaneID INT,
    KursusID INT,
    Hinne CHAR(1),
    PRIMARY KEY (OpilaneID, KursusID),
    FOREIGN KEY (OpilaneID) REFERENCES Opilased(ID),
    FOREIGN KEY (KursusID) REFERENCES Kursused(ID)
);

9. Superkey (Supervõti)
    
Definitsioon: Veergude komplekt, mis tuvastab kirje unikaalselt. See võib sisaldada ka lisaandmeid, mida unikaalsuseks tegelikult vaja pole.
Kasutus: Teoreetiline kontseptsioon kandidaatvõtmete leidmiseks.
Erinevus: Kõik primaarvõtmed on supervõtmed, kuid mitte kõik supervõtmed pole primaarvõtmed (kuna supervõti võib olla "üleliigselt suur").

-- Tabelis Kasutajad (ID, Isikukood, Nimi)
-- Supervõtmed on: (ID), (Isikukood), (ID, Nimi), (ID, Isikukood, Nimi)

11. Candidate Key (Kandidaatvõti)
    
Definitsioon: Minimaalne supervõti – veergude kogum, mis tuvastab kirje unikaalselt ilma liigsete veergudeta.
Kasutus: Nende hulgast valitakse välja üks Primary Key.
Erinevus: Neid võib olla mitu, aga primaarvõtmeks saab neist vaid üks.
-- Tabelis Töötajad on Kandidaatvõtmed: TöötajaID, Isikukood, Email.
   
11. Alternate Key (Alternatiivvõti)
Definitsioon: Kandidaatvõti, mida ei valitud primaarvõtmeks.
Kasutus: Kasutatakse sageli unikaalsuse kontrolliks (Unique constraint).
Erinevus: See on "varu-unikaalvõti", mis jäi primaarvõtme valimisel teiseks.
-- Kui Primaarvõti = TöötajaID, siis Alternatiivvõti = Isikukood.
