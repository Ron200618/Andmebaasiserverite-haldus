 [Vaated](vaade.md) | [Võtmed](keys.md) | [Protseduurid](protseduur.md) | [Kasutaja loomine SQL Server](kasutaja.md) | [Kasutaja loomine XAMPP-is](kasutaja_xamp.md) | [Triggerid](triger.md)





<img width="1595" height="512" alt="{0BEC033B-7EAD-4859-8038-691F2A72B2B7}" src="https://github.com/user-attachments/assets/2c660aa1-3b13-4781-a7fd-53eb9167ac96" />

```
create database lubek;
use lubek;
create table auto(
autonumber char(6) primary key,
mark varchar(30),
mudell varchar(50),
v_aasta int,
varv varchar(50),
hind money);

select * from auto

-- mockaroo.com -- kasutame andmete genereerimiseks

insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('2946Cs', 'Mazda', 'Navajo', 1992, 'Aquamarine', '€2952,08');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('759q6C', 'Mitsubishi', 'Montero', 2000, 'Puce', '€3772,83');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('414CjF', 'Land Rover', 'Discovery', 2004, 'Crimson', '€1702,97');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('451JMy', 'Nissan', 'Armada', 2007, 'Fuscia', '€113,55');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('890Urb', 'Infiniti', 'J', 1993, 'Aquamarine', '€7971,67');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('246Xlm', 'Chevrolet', 'Monte Carlo', 2005, 'Aquamarine', '€65,00');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('916Syj', 'Pontiac', 'Grand Prix', 2002, 'Teal', '€5488,10');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('392Cg1', 'Ford', 'Bronco II', 1989, 'Indigo', '€6279,71');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('357qT1', 'Chevrolet', 'Monte Carlo', 1996, 'Khaki', '€4357,77');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('028wXk', 'Dodge', 'Ram', 2009, 'Maroon', '€7545,16');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('025sX9', 'Chevrolet', 'Suburban 2500', 1994, 'Goldenrod', '€9104,87');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('702V4C', 'Chevrolet', 'S10', 2003, 'Violet', '€4619,08');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('630S5e', 'Chevrolet', 'Silverado 2500', 2012, 'Crimson', '€8965,09');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('317OOK', 'Chevrolet', 'HHR', 2006, 'Pink', '€5551,88');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('864tTw', 'Toyota', '4Runner', 2003, 'Teal', '€7269,40');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('4788c7', 'Mitsubishi', 'Montero Sport', 2002, 'Indigo', '€822,02');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('040OeX', 'Chevrolet', 'S10', 1994, 'Khaki', '€2753,08');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('068Xds', 'GMC', 'Jimmy', 1992, 'Goldenrod', '€9538,67');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('824TPh', 'GMC', 'Canyon', 2011, 'Pink', '€6204,57');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('036wqS', 'Mazda', 'Miata MX-5', 1995, 'Mauv', '€6091,85');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('159zNT', 'Dodge', 'Caravan', 2010, 'Crimson', '€8021,82');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('067GRm', 'Scion', 'tC', 2012, 'Fuscia', '€9643,85');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('265CY7', 'Dodge', 'Charger', 1969, 'Khaki', '€1669,12');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('6935Ih', 'Subaru', 'Leone', 1985, 'Yellow', '€7046,66');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('611BT4', 'Isuzu', 'Rodeo', 1995, 'Pink', '€2264,65');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('011KQZ', 'Audi', 'Q5', 2010, 'Violet', '€4645,70');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('786PD8', 'Dodge', 'Ram 2500', 2003, 'Red', '€3945,55');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('9515In', 'GMC', 'Yukon', 1992, 'Purple', '€7766,36');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('9018GH', 'GMC', 'Savana 2500', 1998, 'Yellow', '€437,52');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('469zAN', 'Mazda', 'MX-6', 1988, 'Turquoise', '€9279,06');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('623I9e', 'Ford', 'E-Series', 1993, 'Yellow', '€3035,42');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('160vHd', 'Chevrolet', 'S10', 1994, 'Purple', '€2734,59');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('721kTr', 'Toyota', 'Celica', 1984, 'Pink', '€8994,74');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('743h2b', 'Hyundai', 'Tucson', 2012, 'Mauv', '€1417,62');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('937tJo', 'Mazda', '929', 1990, 'Crimson', '€782,66');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('063qEy', 'Volkswagen', 'Corrado', 1991, 'Turquoise', '€3993,49');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('6937nU', 'Suzuki', 'Grand Vitara', 2005, 'Maroon', '€4509,95');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('765U1o', 'Mercedes-Benz', 'Sprinter 2500', 2011, 'Khaki', '€1094,09');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('273W3A', 'Mazda', 'MPV', 2002, 'Blue', '€5313,27');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('078cqT', 'Suzuki', 'Sidekick', 1992, 'Crimson', '€5808,96');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('037MNl', 'Chrysler', 'Concorde', 1995, 'Blue', '€2226,37');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('592ti2', 'Mitsubishi', '3000GT', 1992, 'Goldenrod', '€1148,34');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('787xci', 'Chevrolet', 'Caprice', 1994, 'Fuscia', '€7468,09');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('407SlG', 'Chrysler', 'PT Cruiser', 2006, 'Mauv', '€8589,00');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('373iFJ', 'BMW', 'Z3', 1998, 'Maroon', '€7867,81');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('7167Jf', 'Infiniti', 'FX', 2011, 'Khaki', '€9640,49');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('478RL9', 'Acura', 'RL', 1998, 'Crimson', '€7610,21');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('350tnE', 'Nissan', 'GT-R', 2010, 'Crimson', '€80,95');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('310mbc', 'Dodge', 'Nitro', 2010, 'Fuscia', '€359,98');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('888R1J', 'Cadillac', 'CTS', 2010, 'Orange', '€3791,33');
```


```SQL
-- näita kõik
Select * from auto;
-- näita ainult mark,mudel ja hind
Select mark, mudell, hind from auto;
-- tingimused
-- sorteerimine - order by -kasvavalt, DEC -  kahanevalt
select mark, mudell, hind
from auto
order by hind DESC;

```

<img width="223" height="59" alt="{460D8C2C-5F5C-4A73-9A7D-6D9694BA7E82}" src="https://github.com/user-attachments/assets/826c494f-b1d7-4ffb-8be8-880ce90e40e0" />

<img width="276" height="408" alt="{61AD9150-01DC-4029-9D87-2DEAE3B95136}" src="https://github.com/user-attachments/assets/6c702e23-4f0a-4080-afad-5a241f7a473e" />

<img width="184" height="54" alt="{3273BF6E-9567-468B-A3B7-AF4C48A793F4}" src="https://github.com/user-attachments/assets/ae756085-7601-46ab-bf4f-5c7b5c41d10d" />

<img width="89" height="250" alt="{53B91E4F-97BD-4E59-B33A-E6A99055B9C5}" src="https://github.com/user-attachments/assets/42624340-d540-4eb1-a388-21b0a125fec1" />

<img width="190" height="62" alt="{7717F46A-79D1-445A-A81E-ED88631A16BB}" src="https://github.com/user-attachments/assets/61e9e58e-74e3-43b1-a8b8-7db2a7dbbc0f" />

<img width="152" height="385" alt="{53A6CE96-3928-4A82-AF72-B5457C0A81FC}" src="https://github.com/user-attachments/assets/154aa6fe-25aa-4a86-8f57-d857f2ae3fb0" />

<img width="314" height="172" alt="{99A077FB-9347-41DC-A5BB-9AA2958C8AA6}" src="https://github.com/user-attachments/assets/436c9cb6-3c6b-4817-a3cd-445190b7e321" />

<img width="241" height="150" alt="{7CB0988A-54C4-48E6-9186-1CE5963EBA6C}" src="https://github.com/user-attachments/assets/a91ada0f-e2b0-4fb0-92e5-d4d534720463" />

<img width="381" height="68" alt="{61D37EB1-1BB1-4EAC-891A-13C1DAEF6DE1}" src="https://github.com/user-attachments/assets/8b5ecc38-9df7-4d91-a359-e873541d728c" />

<img width="324" height="387" alt="{972D9C15-A5E4-49BD-8AC3-CC6E07F98611}" src="https://github.com/user-attachments/assets/b13b132f-8db0-4425-9abd-30c5c58352d0" />

```SQL
--vaade loomine -VIEW
CREATE VIEW pontiacAutod
AS
select mark, autonumber, hind
FROM AUTO
WHERE MARK LIKE 'Pontiac';

-- view kasutamine
Select * from pontiacAutod;
```

<img width="223" height="36" alt="{4CAE0CB9-F417-4389-9CCA-7C7E7B47F8E5}" src="https://github.com/user-attachments/assets/9181713f-88c1-492a-95c4-5db54c749c95" />

<img width="265" height="150" alt="{6A8FB00F-496F-4140-B9AD-29672D13CE73}" src="https://github.com/user-attachments/assets/c39c2227-db40-4e9c-a106-b629fd539a2e" />

<img width="346" height="139" alt="{FD123CF1-628E-4CE5-BACC-7E2FF1098EB7}" src="https://github.com/user-attachments/assets/dd16804c-95a4-419a-bbfe-78b6a567a8aa" />

<img width="410" height="149" alt="{1353C0B0-00DC-4848-9478-4A68EECF9C85}" src="https://github.com/user-attachments/assets/1d8d71f4-8295-4fa9-a39d-5c5d6ebef7d8" />

<img width="364" height="70" alt="{A4FC3576-E884-4AC2-B124-3DECCC89E649}" src="https://github.com/user-attachments/assets/49be4a4c-fb30-429f-8a1c-dbdb9f846204" />

```sql
--Leia iga marki kohta keskmine autohind
SELECT mark, AVG(hind) AS 'auto keskmine hind'
FROM auto
GROUP BY mark;
```

<img width="240" height="383" alt="{2C09EDE5-6C3A-4391-A6DD-AEAF16927AFF}" src="https://github.com/user-attachments/assets/6ac9a1dc-5c41-4ec4-8575-41fd71f2b140" />

