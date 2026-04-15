create database LOGITpe24baas;
use LOGITpe24baas;
--tabeli loomine
CREATE TABLE opilane(
opilaneID int Primary Key identity(1, 1),
eesnimi varchar(25),
perekonnanimi varchar(30) not null,
synniaeg date,
pohitoetus bit,
address TEXT,
keskmineHinne decimal(2, 1))

SELECT * FROM opilane;

--andmete lisame tabelisse
insert into opilane(perekonnanimi, eesnimi, synniaeg)

VALUES('Valge', 'Sall', '2020-05-10'),
('Roheline', 'Pall', '2023-01-12')

--uuendame tabelite andmeid
UPDATE opilane SET address='Tallinn, Eesti'
UPDATE opilane SET pohitoetus=1 --1 on true,
UPDATE opilane SET keskmineHinne=4.5;
--kui soovime kõik veerud kaivitada - ei pea neid nimetama
insert into opilane
VALUES('Nimi', 'Perenimi', '2020-05-10', 0, 'Tartu, Eesti', 3.5)

CREATE TABLE opilaneTunnis(
opilaneTunnisID int Primary Key identity(1, 1),
kuupaev date not null,
opilaneid int,
Foreign Key (opilaneid) references opilane(opilaneid), --tabel(PK veerg)
oppeaine varchar(25),
hinne int)
Select * from opilane;



## UUS RIDA




-- uue veeru lisamine
ALTER TABLE opilane ADD telefon varchar(1);

--tabeli struktuuri muutmine -veeru kustutamine
ALTER TABLE opilane DROP COLUMN telefon;

--tabeli muutmine - veeru andmetüübi vahetamine
ALTER TABLE opilane ALTER COLUMN telefon varchar(13);
--store procedure help, mis näitab tabeli struktuuri ja veerude andmetüüpe
sp_help opilane;
drop table ryhm;
CREATE TABlE ryhm(
ryhmID int  NOT NULL,
ryhmNimi varchar(10));
Select * from ryhm;
-- muudame tabeli ryhm ja lisame Primary Key
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm Primary Key (ryhmID);

--muudame tabeli ryhm ja teeme ryhmnimi unikaalseks UNIQUE
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm Unique(ryhmNimi);

sp_help ryhm;

--täidame tabeli ryhm
INSERT INTO ryhm(ryhmID, ryhmNimi)
Values (3, 'LOGITpe24'),(4,'TITpe24');
Select * FROM ryhm;

--FOREIGN KEY --opilane tabelis
--lisame opilane tabelisse uus veerg
ALTER TABLE opilane add ryhmID int;
SELECT * FROM opilane
SELECT * FROM ryhm

--lisame ryhmID foreign key
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmID) REFERENCES ryhm(ryhmID) --link tabel(PK veerg)

--kontrollimiseks täidame tabeli opilane
insert into opilane
VALUES ('Kevin', 'Allik', '2020-05-10', 0, 'Tartu, Eesti', 4.5, '+35555', 3)
