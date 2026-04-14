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
