## „Andmebaasi võtmed (Keys)“

# Primary Key
Definitsioon: Unikaalne number või väärtus veerus, mis tuvastab iga rea üheselt
Kasutamine: Tagab, et tabelis ei ole identseid ridu, võimaldab kiiret andmete otsingut ja on aluseks suhete loomisel teiste tabelitega
Erinevus: Tabelis saab olla ainult üks peavõti. See ei tohi kunagi sisaldada tühja väärtust (NOT NULL) ega korduvaid väärtusi

<img width="268" height="62" alt="Screenshot 2026-05-27 at 00 09 36" src="https://github.com/user-attachments/assets/a8230732-170b-41d2-938c-95696fbe0fc0" />


# Foreign Key
Definitsioon: Veerg, mis ühendab tabeli teise tabeli peavõtmega, et luua loogilisi seoseid
Kasutamine: Tabelitevaheliste seoste (nt One-to-Many) hoidmiseks. See hoiab ära vigased andmed, lubamata viidata kirjele, mida seotud tabelis ei eksisteeri
Erinevus: Erinevalt peavõtmest võib välisvõti sisaldada korduvaid väärtusi ja ka tühje (NULL) väärtusi. Ühes tabelis võib olla mitu välisvõtit

<img width="555" height="133" alt="Screenshot 2026-05-27 at 00 13 20" src="https://github.com/user-attachments/assets/286522c7-43e6-4593-94e4-e8cd5889f462" />



# Unique Key
Definitsioon: Piirang, mis tagab, et kõik väärtused veerus on kordumatud
Kasutamine: Andmete unikaalsuse nõudmiseks veergudes, mis ei ole peavõtmed (nt isikukood, e-posti aadress)
Erinevus: Erinevalt peavõtmest võib unikaalne võti sisaldada NULL väärtust ning ühes tabelis võib olla mitu unikaalse piiranguga veergu

<img width="329" height="81" alt="Screenshot 2026-05-27 at 00 14 17" src="https://github.com/user-attachments/assets/07dbf12d-7d14-4896-b5d9-62956b799c95" />



# Simple Key
Definitsioon: Võti (olgu see Primary, Foreign või Unique), mis koosneb ainult ühest ainukesest veerust
Kasutamine: Kõige tavalisem viis rea tuvastamiseks või tabelite sidumiseks (nt autonoomne ID)
Erinevus: See ei vaja oma funktsiooni täitmiseks enda kõrvale ühtegi teist veergu




# Composite Key
Definitsioon: Võti, mis koosneb kahest või enamast veerust, et tagada rea unikaalsus
Kasutamine: Juhtudel, kus üksikud veerud võivad korduda, aga nende kombinatsioon peab olema unikaalne (nt istekoht saalis)
Erinevus: Koosneb alati mitmest veerust, mis võivad viidata ka erinevatele tabelitele
<img width="337" height="99" alt="Screenshot 2026-05-27 at 00 16 05" src="https://github.com/user-attachments/assets/badead3a-0ee1-4387-adaf-203924c2c5e5" />



# Compound Key
Definitsioon: Liitvõtme alamliik, kus kõik võtme koosseisu kuuluvad veerud on eraldiseisvalt välisvõtmed teistesse tabelitesse
Kasutamine: Many-to-Many suhete realiseerimiseks vahetabelites
Erinevus: Erinevalt tavalisest liitvõtmest koosneb ühendvõti rangelt ainult teistele tabelitele viitavatest välisvõtmetest


<img width="702" height="140" alt="Screenshot 2026-05-27 at 00 18 32" src="https://github.com/user-attachments/assets/c0a96601-f97d-4a33-bff4-3664d4956835" />



# Superkey
Definitsioon: Ükskõik milline veergude kombinatsioon, mis võimaldab ridade unikaalset tuvastamist
Kasutamine: Teoreetiline mõiste projekteerimisel, millest hakatakse sõeluma reaalseid peavõtmeid
Erinevus: Võib sisaldada "üleliigseid" veerge, mis ei ole unikaalsuseks hädavajalikud (nt ID + eesnimi)
SQL Näide: (Teoreetiline näide: tabelis Tootajad on ülemvõtmeks kombinatsioon (AutoID, AutoKategooriaID)

# Candidate key
Definitsioon: Minimaalne võimalik ülemvõti – veerg või grupp, mis tuvastab rea ilma liigsete andmeteta
Kasutamine: Nende seast valitakse lõplik peavõti (Primary Key)
Erinevus: Erineb ülemvõtmest selle poolest, et sealt on eemaldatud kõik mittevajalikud veerud
SQL Näide: (Tabelis on AutoID kandidaatvõti).



# Key Alternate Key
Definitsioon: Kandidaatvõti, mida ei valitud tabeli peavõtmeks
Kasutamine: Toimib süsteemis teisese unikaalsuse tagajana
Erinevus: Kui peavõti on määratud, saavad ülejäänud kandidaatvõtmed automaatselt alternatiivvõtmeteks
SQL Näide: (Kui AutoID on peavõti, siis Isikukood on alternatiivvõti).


# allikad
https://www.techtarget.com/searchdatamanagement/answer/Definition-of-primary-super-foreign-and-candidate-key-in-the-DBMS
https://www.techtarget.com/searchdatamanagement/answer/Definition-of-primary-super-foreign-and-candidate-key-in-the-DBMS
https://en.wikipedia.org/wiki/Candidate_key
https://unstop.com/blog/difference-between-super-key-and-candidate-key
https://en.wikipedia.org/wiki/Surrogate_key
https://en.wikipedia.org/wiki/Composite_key

