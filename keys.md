## „Andmebaasi võtmed (Keys)“

# Primary Key
unikaalne number veerus
Milleks kasutatakse: Tagab, et tabelis ei ole identseid ridu. Võimaldab kiiret andmete otsingut ja on aluseks suhete loomisel teiste tabelitega.
Mille poolest erineb: Tabelis saab olla ainult üks Primary Key. See ei tohi kunagi sisaldada tühja väärtust (NOT NULL) ega korduvaid väärtusi.


# Foreign Key
ühendab primary key-ga veergudes, et luua loogilis seoseid
Milleks kasutatakse: Tabelitevaheliste seoste loomiseks ja hoidmiseks (näiteks One-to-Many suhe). Hoiab ära vigased andmed (ei luba lisada elanikku linna, mida pole olemas).
Mille poolest erineb: Erinevalt Primary Key'st võib Foreign Key sisaldada korduvaid väärtusi ja ka NULL väärtusi. Ühes tabelis võib olla mitu välisvõtit.



# Unique Key
tagab, et kõik väärtused on unikaalsed
Milleks kasutatakse: Andmete unikaalsuse nõudmiseks veergudes, mis ei ole peavõtmed (näiteks isikukood, e-maili aadress, kasutajanimi).
Mille poolest erineb: Erinevalt Primary Key'st võib Unique Key veerg sisaldada NULL väärtust (MySQL-is isegi mitut NULL väärtust). Samuti võib ühes tabelis olla mitu Unique piiranguga veergu.



# Simple Key
Võti (olgu see Primary, Foreign või Unique), mis koosneb ainult ühest ainukesest veerust.
Milleks kasutatakse: Kõige tavalisem ja lihtsam viis rea tuvastamiseks või sidumiseks (nt tavaline autonoomne id või isikukood).
Mille poolest erineb: Erineb Composite ja Compound võtmetest, kuna ei vaja enda kõrvale ühtegi teist veergu, et oma funktsiooni täita.



# Composite Key
Võti, mis koosneb kahest või enamast veerust, et tagada rea unikaalsus.
Milleks kasutatakse: Juhtudel, kui üksikud veerud eraldi võivad korduda, kuid nende kombinatsioon peab olema unikaalne (näiteks kinosaali kohad: rida ja iste).
Mille poolest erineb: Koosneb mitmest veerust. Selles kombinatsioonis võivad alamveerud viidata ka täiesti erinevatele tabelitele (eriti vahetabelites).



# Compound Key
Liitvõtme (Composite Key) alamliik, kus kõik võtme koosseisu kuuluvad veerud on eraldiseisvalt välisvõtmed (Foreign Keys) teistesse tabelitesse.
Milleks kasutatakse: Mitmetest-mitmele (Many-to-Many) suhete realiseerimiseks mõeldud vahetabelites.
Mille poolest erineb: Kui Composite Key võib sisaldada ka tavalisi veerge (nagu kuupäev või arv), siis Compound Key koosneb rangelt ainult välisvõtmetest.



# Superkey
Ükskõik milline veergude kombinatsioon, mis võimaldab tabelis ridade unikaalset tuvastamist.
Milleks kasutatakse: Teoreetiline mõiste andmebaasi projekteerimisel, millest hakatakse välja sõeluma reaalseid peavõtmeid.
Mille poolest erineb: Superkey võib sisaldada "üleliigseid" veerge. Näiteks kombinatsioon (isik_id, eesnimi, perekonnanimi) on ülemvõti, sest juba isik_id üksinda teeb rea unikaalseks, ülejäänud andmed on lihtsalt kaasas.



# Candidate key
Minimaalne võimalik Superkey – veerg või veergude grupp, mis suudab rida unikaalselt tuvastada ilma ühegi üleliigse veeruta.
Milleks kasutatakse: Nende seast valib andmebaasi looja välja selle ühe ja õige Primary Key.
Mille poolest erineb: Erineb Superkey'st selle poolest, et sealt on kõik üleliigne eemaldatud. Tabelis võib olla mitu kandidaatvõtit (näiteks isiku puhul nii isik_id kui ka isikukood).




# Key Alternate Key
Kandidaatvõti (Candidate Key), mida ei valitud tabeli peavõtmeks (Primary Key).
Milleks kasutatakse: Toimib süsteemis teisese unikaalsuse tagajana.
Mille poolest erineb: Kui tabelis valitakse peavõtmeks töötaja_id, siis automaatselt saab teisest unikaalsest veerust (nt isikukood või email) alternatiivvõti.


