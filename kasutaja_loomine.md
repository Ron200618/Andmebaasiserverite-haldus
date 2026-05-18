## Kasutajate autentimine ja õiguste haldamine
Mis on autentimine SQL Serveris
## Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverise sisse logida

SQL kasutatakse kahte peamist autentimise tüüpi

1. Widnow authentication
. Sellel puhul kasutatakse kasutajaid sama kasutajaandmed, millega logitakse windows operatsioonsüsteemi.
(kasutajanimi ja parool on seotud SQL)

2. SQK Server authentication
 Sellel puhul luuakse kasutaja otse SQL servise



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


>>>>>pilt
3. Andmebaasi kasutaja loomine (User)
Ava:

Database → Security → Users
Tee paremklikk:  New User...

Seosta kasutaja loginiga
>>>>>pilt
Membership ja õigused
Menüüst Membership saab määrata kasutaja rollid.

db_datareader → võib lugeda
db_datawriter → võib kirjutada
>>>>>pilt
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
    

    
