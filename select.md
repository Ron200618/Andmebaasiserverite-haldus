
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
