-- Rechtsklick run selected query
DROP TABLE IF EXISTS Kuenstlerin;

-- Tabelle für Künstler*innen

CREATE TABLE Kuenstlerin (
    Vornamen TEXT,
    Nachname TEXT,
    GND TEXT PRIMARY KEY,
    Geburtsjahr INTEGER,
    Todesjahr INTEGER,
    Geburtsort TEXT,
    Genre TEXT
);

INSERT INTO Kuenstlerin (Vornamen, Nachname, GND, Geburtsjahr, Todesjahr, Geburtsort, Genre)
VALUES ('Camille', 'Claudel', '118814516', 1864, 1943, 'Fère-en-Tardenois', 'Bildhauerin');

INSERT INTO Kuenstlerin (Vornamen, Nachname, GND, Geburtsjahr, Todesjahr, Geburtsort, Genre)
VALUES ('Paula', 'Modersohn-Becker', '118582933', 1876, 1907, 'Dresden', 'Malerin');

INSERT INTO Kuenstlerin (Vornamen, Nachname, GND, Geburtsjahr, Todesjahr, Geburtsort, Genre)
VALUES ('Clara', 'Westhoff', '118816969', 1878, 1954, 'Bremen', 'Bildhauerin');

SELECT * from Kuenstlerin;

-- Tabelle für Kunstwerke und Beziehung zu Künstler*innen und Ausstellungsorte

CREATE TABLE Kunstwerk(
    Titel TEXT,
    KuenstlerinGND TEXT,
    WerkNummer PRIMARY KEY,
    Erstellungsjahr INTEGER,
    Material TEXT,
    Hoehe INTEGER,
    Breite INTEGER,
    Tiefe INTEGER, 
    FOREIGN KEY (KuenstlerinGND) REFERENCES Kuenstlerin(GND)
);

INSERT INTO Kunstwerk (WerkNummer, Titel, Erstellungsjahr, Material, Hoehe, Breite, Tiefe, KuenstlerinGND)
VALUES ('118814516-001', 'L Âge mûr', 1893, 'Bronze', 114, 163, 72, '118814516');

INSERT INTO Kunstwerk (WerkNummer, Titel, Erstellungsjahr, Material, Hoehe, Breite, Tiefe, KuenstlerinGND)
VALUES ('118582933-001', 'Selbstbildnis vor grünem Hintergrund mit blauer Iris', 1905, 'Öl auf Leinwand', 40.7, 34.5, 0, '118582933');

INSERT INTO Kunstwerk (WerkNummer, Titel, Erstellungsjahr, Material, Hoehe, Breite, Tiefe, KuenstlerinGND)
VALUES ('118816969-001', 'Büste von Paula Modersohn-Becker', 1899, 'Bronze', 46.5, 1, 1, '118816969');

SELECT * from Kunstwerk;

-- Tabelle für Ausstellungsorte inkl Beziehung zu Kunstwerken (?)

DROP TABLE IF EXISTS Ausstellungsort;

CREATE TABLE Ausstellungsort ( 
    Name TEXT,
    Stadt TEXT,
    ISILNummer PRIMARY KEY,
    Art TEXT
);

INSERT INTO Ausstellungsort (Name, Stadt, ISILNummer, Art)
Values ('Paula Modersohn-Becker Museum', 'Bremen', 'DE-MUS-027718', 'Museum');

INSERT INTO Ausstellungsort (Name, Stadt, ISILNummer, Art)
Values ('Hamburger Kunsthalle', 'Hamburg', 'DE-MUS-059210', 'Museum');

INSERT INTO Ausstellungsort (Name, Stadt, ISILNummer, Art)
Values ('Musée Rodin', 'Paris', 'FR-75107-MUS01', 'Museum');

SELECT * from Ausstellungsort;

-- Mehrere Werte einfügen

Insert into Ausstellungsort (Name, Stadt, ISILNummer, Art)
Values
('Deichtorhallen', 'Hamburg', '0-1', 'Museum'),
('Pinakothek der Moderne', 'München', '0-2', 'Museum'),
('Universitätsbibliothek Mainz', 'Mainz', 'DE-77', 'Bibliothek'),
('Alte Nationalgalerie', 'Berlin', 'DE-MUS-814', 'Museum');