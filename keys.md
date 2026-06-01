[Tagasi readme.md file](README.md) | [Select laused](select.md) | [Kasutaja loomine SQL Server](kasutaja.md) | [Kasutaja loomine XAMPP-is](kasutaja.xampp.md) | [Triggerid](triger.md)



## „Andmebaasi võtmed (Keys)“

# Primary Key
Definitsioon: Unikaalne number, millega saab ühendata teiste tabelitega ja veergudega.


Kasutamine: Tagab, et tabelis ei ole identseid veerge ja on hea suhete loomisel teiste tabelitega


Erinevus: Tabelis saab olla ainult üks peavõti. See ei tohi kunagi sisaldada tühja väärtust ega korduvaid väärtusi

<img width="235" height="39" alt="Screenshot 2026-05-31 at 21 26 41" src="https://github.com/user-attachments/assets/28996520-8f9f-4418-94af-4eda94b46513" />


# Foreign Key
Definitsioon: Veerg, mis ühendab tabeli teise tabeli peavõtmega, et luua seoseid.


Kasutamine: Tabelitevaheliste seoste hoidmiseks.


Erinevus: Erinevalt peavõtmest võib välisvõti sisaldada korduvaid väärtusi ja ka tühje (NULL) väärtusi. Ühes tabelis võib olla mitu välisvõtit

<img width="555" height="133" alt="Screenshot 2026-05-27 at 00 13 20" src="https://github.com/user-attachments/assets/286522c7-43e6-4593-94e4-e8cd5889f462" />



# Unique Key
Definitsioon: Piirang, mis tagab, et kõik väärtused veerus on unikaalsed


Kasutamine: Andmete unikaalsuse nõudmiseks veergudes, mis ei ole peavõtmed


Erinevus: Erinevalt peavõtmest võib unikaalne võti sisaldada NULL väärtust ning ühes tabelis võib olla mitu unikaalse piiranguga ridu

<img width="329" height="81" alt="Screenshot 2026-05-27 at 00 14 17" src="https://github.com/user-attachments/assets/07dbf12d-7d14-4896-b5d9-62956b799c95" />



# Simple Key
Definitsioon: Võti (olgu see Primary, Foreign või Unique), mis koosneb ainult ühest ainukesest veerust


Kasutamine: Kõige tavalisem viis rea tuvastamiseks või tabelite sidumiseks (nt ID)


Erinevus: See ei vaja oma funktsiooni täitmiseks enda kõrvale ühtegi teist veergu




# Composite Key/Compound key
Definitsioon: Võti, mis koosneb kahest või enamast veerust, et tagada rea unikaalsus


Kasutamine: Juhtudel, kus üksikud veerud võivad korduda, aga nende kombinatsioon peab olema unikaalne


Erinevus: Koosneb alati mitmest veerust, mis võivad viidata ka erinevatele tabelitele

<img width="374" height="129" alt="Screenshot 2026-05-31 at 21 31 10" src="https://github.com/user-attachments/assets/632e42b9-75c4-41ee-825d-16e6778061ea" />



# Superkey
Definitsioon: Mis tahes veerg või veergude kombinatsioon, mis tagab tabelis read oleksid unikaalsed. Võib sisaldada üleliigseid veerge, mis pole unikaalsuseks vaja.


Kasutamine: Kõik muud võtmed (Candidate, Primary, Alternate) on tegelikult Superkey.


Erinevus: Erineb kandidaatvõtmest selle poolest, et ei pea olema minimaalne. Kui sul on tabelis unikaalne KasutajaID, siis on ülemvõti ka (KasutajaID, Eesnimi, Perekonnanimi).

<img width="537" height="33" alt="Screenshot 2026-05-31 at 21 33 35" src="https://github.com/user-attachments/assets/a17d8e4b-49f8-4b3d-8d27-c751707b9fee" />


SQL Näide: (Teoreetiline näide: tabelis Tootajad on ülemvõtmeks kombinatsioon (AutoID, AutoKategooriaID)


# Candidate key
Definitsioon: Minimaalne võimalik ülemvõti veerg või grupp, mis tuvastab rea ilma liigsete andmeteta


Kasutamine: Nende seast valitakse lõplik peavõti ehk primary Key


Erinevus: Erineb ülemvõtmest selle poolest, et sealt on eemaldatud kõik mittevajalikud veerud

SQL Näide: Kandidaatvõtmed on kõik veerud, millele on määratud kas PRIMARY KEY või UNIQUE piirang. Allolevas koodis on meil tabeli loomise hetkel kolm kandidaatvõtit: KasutajaID, Isikukood ja Emeil.

<img width="391" height="97" alt="Screenshot 2026-05-31 at 21 05 48" src="https://github.com/user-attachments/assets/b16d594b-1491-4eb0-9983-fe6dc36f48b6" />

KasutajaID on Kandidaatvõti, mis valiti PEAVÕTMEKS (Primary Key)
Isikudkood on Kandidaatvõti, mis on ALTERNATIIVVÕTI (Alternate Key)



# Key Alternate Key
Definitsioon: Kandidaatvõti, mida ei valitud tabeli peavõtmeks


Kasutamine: Toimib süsteemis teisese unikaalsuse tagajana


Erinevus: Kui peavõti on määratud, saavad ülejäänud kandidaatvõtmed automaatselt alternatiivvõtmeteks


SQL Näide: (Kui AutoID on peavõti, siis Isikukood on alternatiivvõti).



# allikad
https://en.wikipedia.org/wiki/Primary_key#Notes


https://en.wikipedia.org/wiki/Foreign_key


https://en.wikipedia.org/wiki/Unique_key


https://www.techtarget.com/searchdatamanagement/answer/Definition-of-primary-super-foreign-and-candidate-key-in-the-DBMS


https://unstop.com/blog/difference-between-super-key-and-candidate-key


https://en.wikipedia.org/wiki/Composite_key


https://en.wikipedia.org/wiki/Superkey


https://en.wikipedia.org/wiki/Candidate_key


https://www.geeksforgeeks.org/sql/sql-alternate-key/


https://gemini.google.com = (mis on simplekey, mis on compund key)
