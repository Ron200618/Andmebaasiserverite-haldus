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
    

    
