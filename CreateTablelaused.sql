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
UPDATE opilane SET pohitoetus=1 --1 on true
UPDATE opilane SET keskmineHinne=4.5;
--kui soovime kõik veerud kaivitada - ei pea neid nimetama
insert into opilane
VALUES('Nimi', 'Perenimi', '2020-05-10', 0, 'Tartu, Eesti', 3.5)
