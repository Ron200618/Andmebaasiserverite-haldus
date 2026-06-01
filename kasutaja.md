[Tagasi readme.md file](readme.md)


## Kasutajate autentimine ja õiguste haldamine

Mis on autentimine SQL Serveris
## Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverise sisse logida

SQL kasutatakse kahte peamist autentimise tüüpi

1. Widnow authentication
. Sellel puhul kasutatakse kasutajaid sama kasutajaandmed, millega logitakse windows operatsioonsüsteemi.
(kasutajanimi ja parool on seotud SQL)

2. SQl Server authentication
 Sellel puhul luuakse kasutaja otse SQL servise
kasutaja ei ole



**näide kasutajast: DirectorRon, parool: Director**

2. Serveritaseme kasutaja loomine (Login)
Sammud
Ava:

Security → Logins
Tee paremklikk ja vali:

New Login...

>>>>>pilt
Harjutamiseks võib eemaldada linnukese:  User must change password at next login
Server Roles
 Menüüst Server Roles saab määrata serveri üldised õigused.

Tavaliselt piisab rollist: public


<img width="756" height="678" alt="{A9F945E9-3091-4B87-8FE7-9FE7534AD65C}" src="https://github.com/user-attachments/assets/4b72b2e5-850e-4088-88fc-e32bbf47b61a" />
2. Andmebaasi kasutaja loomine (User)
Ava:

Database → Security → Users
Tee paremklikk:  New User...

Seosta kasutaja loginiga
<img width="292" height="273" alt="{6497989F-0BE9-4DD8-A914-A2352AEE891B}" src="https://github.com/user-attachments/assets/e2d8769c-8b40-4791-bcd0-f880d2ab0bf1" />

## Membership ja õigused
Menüüst Membership saab määrata kasutaja rollid.

db_datareader → võib lugeda SELECT
db_datawriter → võib kirjutada INSERT, UPDATE, DELETE



<img width="516" height="559" alt="{8EFECA76-BBB1-4F49-9016-30BF73A77B21}" src="https://github.com/user-attachments/assets/4bff1876-4dba-4073-84f2-0a0cc2de3f2d" />

<img width="712" height="195" alt="{AFF3D566-2A9D-477A-B220-55D28B1A6E85}" src="https://github.com/user-attachments/assets/9dc1addc-8209-4ea9-9290-7de9189ff739" />

-------------------------------------------------------------------------------
# kasutaja õiguste kontroll

1. tuleb sisselogida kasutajana directorRon. Connect ---> Database Engine

   <img width="306" height="310" alt="{2712AE50-4B47-46BA-997E-5D0BCB159033}" src="https://github.com/user-attachments/assets/4338ff3e-8e07-4952-9104-9772a04e32ab" />


   <img width="518" height="516" alt="{C372D1A2-A003-42B5-B493-FC0AF647B12C}" src="https://github.com/user-attachments/assets/1e98ef3b-ec18-4ece-94d5-28a143b939ad" />

   2. Saab tabeli sisu näha ja sisestada uus kiri.
   <img width="867" height="658" alt="{87D66258-9CF6-495F-B490-2EED37A25DD0}" src="https://github.com/user-attachments/assets/93168b9a-959f-4b66-91f5-95ab02595420" />

   3. kontrollime tegevus, mis ei ole lubatud kasutajale, näiteks tabeli loomine
<img width="554" height="570" alt="{93476A54-8DA4-47E3-9EA2-857D7CECFDFE}" src="https://github.com/user-attachments/assets/a20f08d8-6136-4c8a-95e5-310d44138172" />






SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
Lahendus
Server → Properties
Security
Vali: SQL Server and Windows Authentication mode
GRANT käsud õiguste jagamiseks
GRANT käsuga antakse kasutajale õigused.

<img width="931" height="975" alt="{4C168EB7-FB7C-4E62-BBA4-6B1A6C65C84B}" src="https://github.com/user-attachments/assets/39561d55-f746-4efa-be47-15009197d30f" />







Käsk	Tähendus
SELECT	Lugemine
INSERT	Lisamine
UPDATE	Muutmine
DELETE	Kustutamine

<img width="553" height="759" alt="{E3DA095D-3DD0-4B4C-BB54-146967BDB45A}" src="https://github.com/user-attachments/assets/91f253c4-db6d-4b58-8b40-9bf3c26d9261" />




Ülesanne 1:
Luua andmebaas: MovieBase

Luua tabelid: 

movies (id, moviesNimi, moviesYear, movieDir и movieCost).
guest (id, name)
Lisada vähemalt 7 kirjet.

Luua kasutaja Produtsent parooliga director, kellel on järgmised õigused:

```
-- GRANT - õiguste määramine
-- DENY - õiguste keelamine

-- db_datareader - SELECT 
-- db_datawriter - INSERT, DELETE, UPDATE

-- anname kasutajale DirectorRon õigus
--ainult kustutuda ja uuendada tabelit
-- (DELETE, UPDATE, SELECT)

grant delete on puhkus to RonDirector;
grant update on puhkus to RonDirector;
grant SELECT on puhkus to RonDirector;

-- keelame INSERT
DENY INSERT on puhkus to RonDirector;

```
Õigus vaadata ja uuendada tabeli movies välju movieDir ja movieCost + lisada üks enda valitud privileeg.
Õigus vaadata ja lisada kirjeid tabelisse guest.
Keela andmete kustutamine tabelis.
Vihje! UPDATE õigused parem lubada SQL käsuga
GRANT UPDATE (movieCost, movieDir)
ON movies
TO Produtsent;
    
-- 2
    Create database MovieBase;

use MovieBase;


CREATE TABLE movies(
Id int primary key identity(1,1),
moviesNimi varchar(25) not null,
moviesYear int,
movieDir text,
movieCost money);

insert into movies (moviesNimi,moviesYear,movieDir,movieCost)
values ('Simpson2', '2002', 'Fredrich', 7)

select * from movies

CREATE TABLE guest(
id int primary key identity(1,1),
name varchar(25) not null);

insert into guest (name)
values ('Piis')

select * from movies
select * from guest

grant delete on movies to Produtsent;

grant SELECT on movies to Produtsent;
grant update on movies to Produtsent;

--- 1
Create database kasutajaBaas;

use kasutajaBaas;
CREATE TABLE puhkus(
puhkusdId int primary key identity(1,1),
nimetus varchar(25) not null,
algus date,
lopp date,
kirjeldus text);
insert into puhkus(nimetus,algus,lopp)
values ('isapuhkus', '2026-02-15', '2026-02-25')

select * from puhkus;
--Security -> Logins -> New login

-- GRANT - õiguste määramine
-- DENY - õiguste keelamine

-- db_datareader - SELECT 
-- db_datawriter - INSERT, DELETE, UPDATE

-- anname kasutajale DirectorRon õigus
--ainult kustutuda ja uuendada tabelit
-- (DELETE, UPDATE, SELECT)

grant delete on puhkus to RonDirector;
grant update on puhkus to RonDirector;
grant SELECT on puhkus to RonDirector;

-- keelame INSERT
grant INSERT on puhkus to RonDirector;
