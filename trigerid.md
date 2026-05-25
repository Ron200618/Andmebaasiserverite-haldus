## Triger - trigger - päästik
## trigger - andmebaasi objekt, mis käivitub automaatselt, kui toimub teatud sündmus (nt INSERT, UPDATE, DELETE)
triggerite loomine - automatseerib protsessid SQL Serveris
Lisaks sellega saab vaatada sündmusi SQL

Tabelid, mis tuleb luua enne trigerit!
```SQL
Create database trigerLogitpe24

use trigerLogitpe24
CREATE TABLE linnad(
linnId int primary key identity (1,1),
linnanimi varchar(25) unique,
maakond varchar(50),
rahvaarv int);

select * from linnad

insert into linnad(linnanimi,maakond,rahvaarv)
VALUES('Haapsalu', 'Läänemaa', 7000)

--tabeli logi - tabel, mis täidab triger, kui kasutaja täidab tabeli linnad
CREATE TABLE logi(
id int primary key identity(1,1),
kasutaja varchar(25),
aeg datetime,
andmed text);
```
