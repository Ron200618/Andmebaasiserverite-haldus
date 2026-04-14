# Andmebaasid LOGITpe24
andmebaasiga seotud sql kood ja konspektid

- SQL - Structured Query Language - Strukteeritud Päringu keel
- DDL - Data Definition Language - andmebaasi struktuuri loomiseks
- DML - Data Manipulation Language -andmete lisamine ja uuendamine tabelis - INSERT, UPDATE, DELETE


### tunniks me kasutame andmebaasihaldussüsteemid
1. SQL Server Management Stuudio (SQL Serveri haldamiseks)<img width="533" height="535" alt="{B56707D7-AE9D-48ED-80D2-649DA9A836CE}" src="https://github.com/user-attachments/assets/523bc7ff-2d88-4dd0-abab-5dceaa11da11" />

2. XAMPP -phpmyadmin (mariaDB andmebaas) -vabavara

# Põhimõisted

 - Andmebaas on struktuuritud andmete kogum
 -Tabel - olem (entity)
 -veerg - väli (field)
 - rida -kirje (record)
 - primaarne võti -PK- Primary Key - veerg (tavaliselt nimega id) unikaalse identifikatooriga, mis erisatb igat kirjet
 - välisvõti (võõrvõti) -FK Foreign Key - veerg, mis loob seose teise tabeli primaarvõtmega.

 - ## Andmetüüpid
 - INT, float, decimal(6,2) - numbrilised
 - varchar(50), char(6) - tekst/sümboolid
 - boolean, bool, bit - loogiline tüüp
 - date, time, datetime - kuupäeva

   ## Piirangug
   ```
   1. Primary key
   2. Foreign Key
   3. Unique
   4. Not null
   5. Check
   ```


   ## tabelivahelised seosed
  - üks - ühele (nt mees -- naine)
  - üks - mitmele (õpilane käib erinevates õppeainetes)
   <img width="1348" height="658" alt="{1228E96E-4B6D-4522-99F2-4E7B4FD3D727}" src="https://github.com/user-attachments/assets/3ac2b1be-4d75-41f7-9f6c-b8d73894536d" />

   - mitu - mitmele (nt õpilane - õpetaja)




##  minu tehtud


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


SELECT * FROM opetaja;
SELECT * FROM opetamine;

<img width="843" height="450" alt="{577327C2-0B15-4128-B49D-551F85499BA2}" src="https://github.com/user-attachments/assets/c84ba17c-b8d6-46e6-935d-25aadd8666ad" />

