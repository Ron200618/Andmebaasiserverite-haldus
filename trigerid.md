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
<img width="567" height="673" alt="{01DFFA58-0805-402D-A991-F61F351CB497}" src="https://github.com/user-attachments/assets/dc78e48d-2d2e-4a96-86ad-f3905ace129c" />
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

```sql
--2. DELETE Triger - jälgib kustutamine tabelis linnad 
--ja teeb vastava kirje logi tabelisse.

create trigger linnaKustutamine
ON linnad --tabel, mida triger jälgib
FOR DELETE
AS
insert into logi(kasutaja, aeg, andmed)
select
SYSTEM_USER, -- sisselogitud user
GETDATE(),
CONCAT('kustutatud:', deleted.linnanimi,', ',
deleted.maakond, ', ' ,deleted.rahvaarv)
FROM deleted;

--kontroll
delete from linnad where linnId=2;

SELECT * from linnad;
select * from logi;
```
<img width="522" height="686" alt="{A6431287-D57F-4263-96FB-A68F943FCADB}" src="https://github.com/user-attachments/assets/414aed26-9cba-4f84-8e68-c8049dda9aec" />

```sql
--3.UPDATE TRIGGER -jälgib uuendused/muutuse tabelis linnad
--ja teeb vastava kirje tabelis logi

create trigger linnaUuendamine
ON linnad --tabel, mida triger jälgib
FOR UPDATE
AS
insert into logi(kasutaja, aeg, andmed)
select
SYSTEM_USER, -- sisselogitud user
GETDATE(),
CONCAT('vana andmed:',
deleted.linnanimi,', ',deleted.maakond, ', ' ,deleted.rahvaarv,
' ||| uued andmed: ',
inserted.linnanimi, ', ' ,inserted.maakond,', ', inserted.rahvaarv) 
FROM deleted inner join inserted
on deleted.linnId=inserted.linnId;

--kontroll
update linnad SET linnanimi='Tallinn22', rahvaarv=70000
where linnId=1;

SELECT * FROM linnad;
SELECT * FROM logi;
```

<img width="533" height="438" alt="{D9372B27-7ACC-4B44-ACAF-6F52EC578531}" src="https://github.com/user-attachments/assets/a92052d6-fa0f-45c5-befd-2888597f1130" />

```sql
--triger sisse/välja lülitamine
DISABLE TRIGGER linnaLisamine on linnad
DISABLE TRIGGER linnaKustutamine on linnad
ENABLE TRIGGER linnaUuendamine on linnad

-- ühine triger mis jälgib kas lisamine või kustutamine tablisse linnad

create trigger linnaUuendus
ON linnad --tabel, mida triger jälgib
FOR insert, delete
AS
BEGIN
SET NOCOUNT ON;
	insert into logi(kasutaja, aeg, andmed)
	select
	SYSTEM_USER, -- sisselogitud user
	GETDATE(),
	CONCAT('LISATUD:', inserted.linnanimi,', ',
	inserted.maakond, ', ' ,inserted.rahvaarv)
	FROM INSERTED

	UNION all

	select
	SYSTEM_USER, -- sisselogitud user
	GETDATE(),
	CONCAT('kustutatud:', deleted.linnanimi,', ',
	deleted.maakond, ', ' ,deleted.rahvaarv)
	FROM deleted;
end;

-- kontroll
delete from linnad where linnId=3;

insert into linnad(linnanimi,maakond,rahvaarv)
VALUES('Jõhvi', 'Viljandimaa', 50000)

SELECT * from linnad;
select * from logi;
```
<img width="559" height="606" alt="{396D2D21-61D0-41FD-8893-0562F9DA4975}" src="https://github.com/user-attachments/assets/5d22ccbc-ef24-4d40-b768-c5e389d2227c" />

# kasutaja õigused triger ja piirang
<img width="518" height="477" alt="{8019C8FC-624E-47E2-9AA4-479204CACC35}" src="https://github.com/user-attachments/assets/68159a2d-26d5-4d8d-a09d-7a84a887092c" />



# iseseisev töö
```sql
-- tabel
create table Elanikud(
Id int primary key identity (1,1),
nimi varchar(25),
vanus int,
aadress varchar(25),
maja_number int)

insert into elanikud(nimi,vanus,aadress, maja_number)
VALUES('Bob',  25, 'Kotka_12', 12)

-- logi
CREATE TABLE logiElanikud(
id int primary key identity(1,1),
kasutaja varchar(25),
aeg datetime,
andmed text);

-- trigger

create trigger ElanikuUuendus
ON Elanikud --tabel, mida triger jälgib
FOR insert, delete
AS
BEGIN
SET NOCOUNT ON;
	insert into LogiElanikud(kasutaja, aeg, andmed)
	select
	SYSTEM_USER, -- sisselogitud user
	GETDATE(),
	CONCAT('LISATUD:', inserted.nimi,', ',
	inserted.aadress, ', ' ,inserted.maja_number)
	FROM INSERTED

	UNION all

	select
	SYSTEM_USER, -- sisselogitud user
	GETDATE(),
	CONCAT('kustutatud:', deleted.nimi,', ',
	deleted.aadress, ', ' ,deleted.maja_number)
	FROM deleted;
end;

delete from Elanikud where Id=2;

insert into elanikud(nimi,vanus,aadress, maja_number)
VALUES('Ron',  18, 'Kotka_12', 12)

SELECT * from Elanikud;
select * from logiElanikud;
```

<img width="467" height="392" alt="{0B9012B7-ADFD-4606-BC82-71439A5FDC50}" src="https://github.com/user-attachments/assets/ad1bce8f-c803-45a0-942a-41f2dfb80641" />



```sql
-- triger 2

create trigger Elanikulisamine
ON Elanikud --tabel, mida triger jälgib
FOR INSERT
AS
insert into logiElanikud(kasutaja, aeg, andmed)
select
SYSTEM_USER, -- sisselogitud user
GETDATE(),
CONCAT('LISATUD:', inserted.nimi,', ',
inserted.aadress, ', ' ,inserted.maja_number)
FROM inserted;

insert into elanikud(nimi,vanus,aadress, maja_number)
VALUES('Karl',  18, 'Tondi_12', 15)

SELECT * from Elanikud;
select * from logiElanikud;
```
<img width="534" height="407" alt="{3E3C9CB4-7ADD-444C-AA38-F926E8381AA9}" src="https://github.com/user-attachments/assets/75c2dcbc-3ce4-4f53-95d8-3f18a6860167" />


```sql
-- triger 3

create trigger ElanikuKustutamine
ON Elanikud --tabel, mida triger jälgib
FOR DELETE
AS
insert into LogiElanikud(kasutaja, aeg, andmed)
select
SYSTEM_USER, -- sisselogitud user
GETDATE(),
CONCAT('kustutatud:', deleted.nimi,', ',
deleted.aadress, ', ' ,deleted.maja_number)
FROM deleted;

delete from Elanikud where Id=3;

SELECT * from Elanikud;
select * from logiElanikud;
```
<img width="486" height="451" alt="{6298E87D-742D-464F-813F-5B0FDD282C8E}" src="https://github.com/user-attachments/assets/80631742-f36f-4245-a745-8320ad6e1cf2" />

# XAMPP / MariaDB päästikud / Triggers

<img width="672" height="631" alt="{2AE2FBC3-4BE5-4120-8874-183CF66CBAEB}" src="https://github.com/user-attachments/assets/41c9c7a2-e311-4f4f-83d6-503419bb1d43" />

Kontrolliks

<img width="728" height="262" alt="{A4D25DC8-9EB0-4700-936C-4CA915F662E8}" src="https://github.com/user-attachments/assets/000438c6-accb-48bf-8c8a-3c2dc135fc08" />

tulemus logi tabelis.
<img width="716" height="51" alt="{FAB94F16-AE5F-4BAB-89C0-03F1F6502AE4}" src="https://github.com/user-attachments/assets/a4f93b49-2666-4665-a9dd-fe2adca3e35a" />

Trigger, mis näeb kustutatud asju
<img width="615" height="386" alt="{327E84B2-ECDB-43F9-8EF1-4A303D7F643F}" src="https://github.com/user-attachments/assets/df2ad7da-46f5-428b-a0ac-6311d75d1fe6" />

Kontroll
<img width="719" height="49" alt="{31299511-92C4-4363-B397-F512EEBAEE70}" src="https://github.com/user-attachments/assets/a215bdfb-4060-46ad-aa1b-d1c12161f140" />

# update
<img width="625" height="567" alt="{FB912076-F9AC-4DD7-AA68-B2A05864A386}" src="https://github.com/user-attachments/assets/ef9df20a-9a0d-4199-94df-a1983568ba54" />

<img width="703" height="68" alt="{9B541247-0790-4DA3-82BC-63C5547B1A3C}" src="https://github.com/user-attachments/assets/5e9fbda3-519e-40d3-b799-b8ec65c123db" />







