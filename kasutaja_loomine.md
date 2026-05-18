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





SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
Lahendus
Server → Properties
Security
Vali: SQL Server and Windows Authentication mode
GRANT käsud õiguste jagamiseks
GRANT käsuga antakse kasutajale õigused.

Käsk	Tähendus
SELECT	Lugemine
INSERT	Lisamine
UPDATE	Muutmine
DELETE	Kustutamine

>>>>>pilt



Ülesanne 1:
Luua andmebaas: MovieBase

Luua tabelid: 

movies (id, moviesNimi, moviesYear, movieDir и movieCost).
guest (id, name)
Lisada vähemalt 7 kirjet.

Luua kasutaja Produtsent parooliga director, kellel on järgmised õigused:
Õigus vaadata ja uuendada tabeli movies välju movieDir ja movieCost + lisada üks enda valitud privileeg.
Õigus vaadata ja lisada kirjeid tabelisse guest.
Keela andmete kustutamine tabelis.
Vihje! UPDATE õigused parem lubada SQL käsuga
GRANT UPDATE (movieCost, movieDir)
ON movies
TO Produtsent;
    

    
