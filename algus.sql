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
Select * from opilaneTunnis;

--Lisame andmeid opilasetunnis tabelisse
INSERT INTO opilaneTunnis
VALUES ('2025-04-14', 2, 'keemia', 4);

Create table testtabel(
id int primary key);
-- tabeli kututamine
DROP TABLE testtabel
DROP DATABASE ...;

--tabelirida kustutamine
select * from opilane;
DELETE FROM opilane WHERE opilaneid=4;








-- opetaja/opetamine
Create table opetaja(
opetajaID int Primary Key identity(1, 1),
nimi varchar(25),
ruum varchar(30) not null,)

insert into opetaja(nimi, ruum)
VALUES('Karl', 'A212')

Create table opetamine(
opetamineID int Primary Key identity(1, 1),
opetajaID int,
Foreign Key (opetajaID) references opetaja(opetajaID),
oppeaine varchar(25),
maht varchar(30) not null,)

insert into opetamine(oppeaine, maht, opetajaID)
VALUES('Eesti Keel', '4 Tundi', 1)
drop table opetamine;
drop database LOGITpe24baas
