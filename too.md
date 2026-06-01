-- ül 1

create database test1235;
use test1235;

CREATE TABLE Klient(
ID int Primary Key identity(1, 1),
eesnimi varchar(50),
pereimi varchar(50))

CREATE TABLE Ost(
ID int Primary Key identity(1, 1),
kliendi_id int,
toote_id int,
Foreign Key (kliendi_id) references Klient(ID),
Foreign Key (toote_id) references Toode(ID))

drop table ost

create table toode(
ID int Primary Key identity(1, 1),
tootenimi varchar(100),
ühikudhind numeric,
ühik varchar(2))

--  ül 3 õigust jagamine Klientnimi
grant delete on ost to klientnimi;
grant update on ost to klientnimi;
grant SELECT on ost to klientnimi;

grant delete on Klient to klientnimi;
grant update on Klient to klientnimi;
grant SELECT on Klient to klientnimi;

deny SELECT on logi to klientnimi;
DENY INSERT on logi to klientnimi;
grant update on Klient to klientnimi;

select * from logi


--- ül 5
create table logi(
ID int Primary Key identity(1, 1),
kasutaja varchar(50),
kuupaev date,
sisestatudAndmed varchar(50))

select * from logi

-- ül 6 trigger ost uuendamise andmed

create trigger Ostuuendamine
ON ost
FOR UPDATE
AS
insert into logi(kasutaja, kuupaev, sisestatudAndmed)
select
SYSTEM_USER,
GETDATE(),
CONCAT('vana andmed:',
deleted.kliendi_id,', ',deleted.toote_id,
' ||| uued andmed: ',
inserted.kliendi_id, ', ' ,inserted.toote_id) 
FROM deleted inner join inserted
on deleted.ID=inserted.ID;

select * from logi


-- ül 7 mis jalgib andmete lisamist ost
create trigger OstLisamineLogi
ON ost
FOR insert
AS
BEGIN
SET NOCOUNT ON;
	insert into  logi(kasutaja, kuupaev, sisestatudAndmed)
	select
	SYSTEM_USER,
	GETDATE(),
	CONCAT('LISATUD:', inserted.kliendi_id,', ',
	inserted.toote_id)
	FROM INSERTED;


-- ül 8 -- klient logid - uuendamine

create trigger Ostuuuendamine
ON ost
FOR UPDATE
AS
insert into logi(kasutaja, kuupaev, sisestatudAndmed)
select
SYSTEM_USER,
GETDATE(),
CONCAT('vana andmed:',
deleted.kliendi_id,', ',deleted.toote_id,
' ||| uued andmed: ',
inserted.kliendi_id, ', ' ,inserted.toote_id) 
FROM deleted inner
join inserted on deleted.ID=inserted.ID;


INSERT INTO Ost (kliendi_id, toote_id) 
VALUES (1, 2);

UPDATE ost 
SET toote_id = 1 
WHERE ID = 14;

select * from logi
SELECT * FROM ost;


-- klient lisamine logi
create trigger KlientLisamineLogi
ON Klient
FOR insert
AS
BEGIN
SET NOCOUNT ON;
	insert into  logi(kasutaja, kuupaev, sisestatudAndmed)
	select
	SYSTEM_USER,
	GETDATE(),
	CONCAT('LISATUD:', inserted.eesnimi,', ',
	inserted.pereimi)
	FROM INSERTED;
end;





-- ül 8 toode logid
create trigger Toodeuuendamine
ON toode
FOR UPDATE
AS
insert into logi(kasutaja, kuupaev, sisestatudAndmed)
select
SYSTEM_USER,
GETDATE(),
CONCAT('vana andmed:',
deleted.tootenimi,
' ||| uued andmed: ',
inserted.tootenimi)
FROM deleted inner join inserted
on deleted.ID=inserted.ID;

select * from logi
drop trigger Toodeuuendamine

insert into toode(tootenimi)
values('ps4')

select * from logi

-- toode lisamine logi
create trigger ToodeLisamineLogi
ON toode
FOR insert
AS
BEGIN
SET NOCOUNT ON;
	insert into  logi(kasutaja, kuupaev, sisestatudAndmed)
	select
	SYSTEM_USER,
	GETDATE(),
	CONCAT('LISATUD:', inserted.tootenimi)
	FROM INSERTED;
end;


Insert into toode(tootenimi,ühikudhind,ühik)
values ('nigalas', 100, 2)

select * from logi



-- ül 10 1 protseduur
CREATE PROCEDURE Tootekogused
	@piirang int
AS
BEGIN
    SELECT 
        tootenimi,
        ühikudhind,
		ühik
	FROM toode
	where ühik <= @piirang;
END;

drop procedure Tootekogused

select * from logi
EXEC Tootekogused 100;



Insert into toode(tootenimi,ühikudhind,ühik)
values ('Saabad', 150, 12)

-- ül 10 2 protseduur

CREATE PROCEDURE ÜhikuhinnaLoogika
	@limit INT
AS
BEGIN
    SELECT 
        tootenimi,
        ühikudhind,
		ühik,
		CASE
            WHEN ühikudhind > @limit THEN 'Kallis toode'
            ELSE 'Keskmine hind'
        END AS Ühikuhinnad
    FROM toode;
END;

drop procedure ÜhikuhinnaLoogika

EXEC ÜhikuhinnaLoogika 10;

-- ül 10 3 protseduur

CREATE PROCEDURE Veeru_lisamine
	@tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);
    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

EXEC Veeru_lisamine 'add', 'toode', 'laoseis', 'INT'
EXEC Veeru_lisamine 'drop', 'toode', 'laoseis';
select * from toode
select * from logi

Insert into Klient(eesnimi, pereimi)
values ('Rin', 'Libek')



-- ül 11 vaadet 1
CREATE VIEW SamsungOtsimine
AS
SELECT tootenimi, ühikudhind, ühik, ost.toote_id
FROM
	toode
	inner join ost on toode.ID = ost.toote_id
WHERE 
    Tootenimi like 'Samsung';



select * from SamsungOtsimine
drop view SamsungOtsimine
-- ül 11 vaadet 2


CREATE VIEW R_Tähe_Otsimine
AS
SELECT eesnimi
FROM
	Klient
	inner join ost on kliendi_ID = ost.kliendi_ID
WHERE 
    eesnimi like 'R%';


drop view R_Tähe_Otsimine
select * from R_Tähe_Otsimine
select * from Klient

-- ül 11 vaade 3

CREATE VIEW L_perenimi_Otsimine
AS
SELECT pereimi
FROM
	Klient
	inner join ost on kliendi_ID = ost.kliendi_ID
WHERE 
    pereimi like 'L%';

drop view L_perenimi_Otsimine
select * from L_perenimi_Otsimine

-- ül 12

CREATE VIEW Tüüpiline_eesti_perenimed
AS
SELECT pereimi, eesnimi
FROM
	Klient
WHERE 
	pereimi in  ('Mets', 'Randma', 'Itoshi', 'Org' ) or
	eesnimi in ('Ron', 'Siim', 'Karl')

select * from Tüüpiline_eesti_perenimed
select * from klient
drop view  Tüüpiline_eesti_perenimed
