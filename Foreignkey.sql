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
