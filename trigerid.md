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

```sql
--1. triger lisatud andmete jälgimiseks tabelis linnad.
--Jälgib andmete sisestamine tabelisse ja teeb vastavva kirje logi-tabelis

create trigger linnaLisamine
ON linnad --tabel, mida triger jälgib
FOR INSERT
AS
insert into logi(kasutaja, aeg, andmed)
select
SYSTEM_USER, -- sisselogitud user
GETDATE(),
CONCAT('LISATUD:', inserted.linnanimi,', ',
inserted.maakond, ', ' ,inserted.rahvaarv)
FROM inserted;

-- kontrollimiseks tuleb lisada linna tablisse linnad
insert into linnad(linnanimi,maakond,rahvaarv)
VALUES('Viljandi', 'Viljandimaa', 50000)

SELECT * from linnad;
select * from logi;
```

<img width="567" height="673" alt="{01DFFA58-0805-402D-A991-F61F351CB497}" src="https://github.com/user-attachments/assets/dc78e48d-2d2e-4a96-86ad-f3905ace129c" />


