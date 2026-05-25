## „Andmebaasi võtmed (Keys)“

# Primary Key
unikaalne number veerus
Milleks kasutatakse: Tagab, et tabelis ei ole identseid ridu. Võimaldab kiiret andmete otsingut ja on aluseks suhete loomisel teiste tabelitega.
Mille poolest erineb: Tabelis saab olla ainult üks Primary Key. See ei tohi kunagi sisaldada tühja väärtust (NOT NULL) ega korduvaid väärtusi.
<img width="309" height="105" alt="{5D5B6777-4220-460D-8424-C4A6B2FEBF01}" src="https://github.com/user-attachments/assets/f113f543-a0b7-4897-862f-ca2622d70db0" />


# Foreign Key
ühendab primary key-ga veergudes, et luua loogilis seoseid
Milleks kasutatakse: Tabelitevaheliste seoste loomiseks ja hoidmiseks (näiteks One-to-Many suhe). Hoiab ära vigased andmed (ei luba lisada elanikku linna, mida pole olemas).
Mille poolest erineb: Erinevalt Primary Key'st võib Foreign Key sisaldada korduvaid väärtusi ja ka NULL väärtusi. Ühes tabelis võib olla mitu välisvõtit.
<img width="469" height="147" alt="{2B7EAFD4-F380-4D98-890C-AB887671F659}" src="https://github.com/user-attachments/assets/d6cba1bd-0428-4d09-8079-2a88dafa516a" />



# Unique Key
tagab, et kõik väärtused on unikaalsed
Milleks kasutatakse: Andmete unikaalsuse nõudmiseks veergudes, mis ei ole peavõtmed (näiteks isikukood, e-maili aadress, kasutajanimi).
Mille poolest erineb: Erinevalt Primary Key'st võib Unique Key veerg sisaldada NULL väärtust (MySQL-is isegi mitut NULL väärtust). Samuti võib ühes tabelis olla mitu Unique piiranguga veergu.
<img width="362" height="214" alt="{1DF7DA34-1413-494A-9B2B-7591E079894F}" src="https://github.com/user-attachments/assets/4a0e0a46-2379-4202-8889-9d5297434863" />



# Simple Key
Võti (olgu see Primary, Foreign või Unique), mis koosneb ainult ühest ainukesest veerust.
Milleks kasutatakse: Kõige tavalisem ja lihtsam viis rea tuvastamiseks või sidumiseks (nt tavaline autonoomne id või isikukood).
Mille poolest erineb: Erineb Composite ja Compound võtmetest, kuna ei vaja enda kõrvale ühtegi teist veergu, et oma funktsiooni täita.
<img width="277" height="198" alt="{FED8AEDC-203C-4E55-9328-55259198B22F}" src="https://github.com/user-attachments/assets/9aae4498-1afb-401a-83c4-5dc581191f76" />



# Composite Key
Võti, mis koosneb kahest või enamast veerust, et tagada rea unikaalsus.
Milleks kasutatakse: Juhtudel, kui üksikud veerud eraldi võivad korduda, kuid nende kombinatsioon peab olema unikaalne (näiteks kinosaali kohad: rida ja iste).
Mille poolest erineb: Koosneb mitmest veerust. Selles kombinatsioonis võivad alamveerud viidata ka täiesti erinevatele tabelitele (eriti vahetabelites).
<img width="371" height="115" alt="{64D5711F-C7A8-4F8A-AC35-54DE496A53F1}" src="https://github.com/user-attachments/assets/9fe60bb3-75da-4bde-9ee2-ea0c69135112" />



# Compound Key
Liitvõtme (Composite Key) alamliik, kus kõik võtme koosseisu kuuluvad veerud on eraldiseisvalt välisvõtmed (Foreign Keys) teistesse tabelitesse.
Milleks kasutatakse: Mitmetest-mitmele (Many-to-Many) suhete realiseerimiseks mõeldud vahetabelites.
Mille poolest erineb: Kui Composite Key võib sisaldada ka tavalisi veerge (nagu kuupäev või arv), siis Compound Key koosneb rangelt ainult välisvõtmetest.
<img width="453" height="135" alt="{BFA71C7A-1022-40A1-A4CA-8635C44776A3}" src="https://github.com/user-attachments/assets/948cf57f-9119-4806-90e3-2be38b3e4903" />



# Superkey
Ükskõik milline veergude kombinatsioon, mis võimaldab tabelis ridade unikaalset tuvastamist.
Milleks kasutatakse: Teoreetiline mõiste andmebaasi projekteerimisel, millest hakatakse välja sõeluma reaalseid peavõtmeid.
Mille poolest erineb: Superkey võib sisaldada "üleliigseid" veerge. Näiteks kombinatsioon (isik_id, eesnimi, perekonnanimi) on ülemvõti, sest juba isik_id üksinda teeb rea unikaalseks, ülejäänud andmed on lihtsalt kaasas.
<img width="359" height="115" alt="{C92C93B4-0D7D-4FD1-B257-5DA8CC59D0ED}" src="https://github.com/user-attachments/assets/58cb10eb-f1cb-4df9-9c31-370cd8e916c1" />



# Candidate key
Minimaalne võimalik Superkey – veerg või veergude grupp, mis suudab rida unikaalselt tuvastada ilma ühegi üleliigse veeruta.
Milleks kasutatakse: Nende seast valib andmebaasi looja välja selle ühe ja õige Primary Key.
Mille poolest erineb: Erineb Superkey'st selle poolest, et sealt on kõik üleliigne eemaldatud. Tabelis võib olla mitu kandidaatvõtit (näiteks isiku puhul nii isik_id kui ka isikukood).
<img width="346" height="137" alt="{456D5F04-9372-4D8F-ACDA-59E355A23F70}" src="https://github.com/user-attachments/assets/ec694213-efde-44a3-89bf-8f7f32bf67c0" />




# Key Alternate Key
Kandidaatvõti (Candidate Key), mida ei valitud tabeli peavõtmeks (Primary Key).
Milleks kasutatakse: Toimib süsteemis teisese unikaalsuse tagajana.
Mille poolest erineb: Kui tabelis valitakse peavõtmeks töötaja_id, siis automaatselt saab teisest unikaalsest veerust (nt isikukood või email) alternatiivvõti.
<img width="380" height="139" alt="{BC8F4273-BED2-4A6F-89E1-B501E7E64A70}" src="https://github.com/user-attachments/assets/affb507b-7701-49e6-b644-579d06b48659" />


