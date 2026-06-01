 [Select laused](select.md) | [Võtmed](keys.md) | [Protseduurid](protseduur.md) | [Kasutaja loomine SQL Server](kasutaja.md) | [Kasutaja loomine XAMPP-is](kasutaja_xamp.md) | [Triggerid](triger.md)



# SQL Vaated (Views)

Vaade (View) on virtuaalne tabel, mille sisu põhineb SQL-i päringu (`SELECT`) tulemusel. Vaade ise ei sisalda andmeid – andmed loetakse reaalajas alustabelitest sellel hetkel, kui vaadet päritakse.

## Miks vaateid kasutada?
1. **Turvalisus:** Sa saad anda kasutajale ligipääsu vaatele, ilma et peaksid andma ligipääsu kogu alustabelile (näiteks peidad vaatest ära isikukoodi või palga veerud).
2. **Keerukuse vähendamine:** Kui sul on hiiglaslik päring mitme `JOIN`-iga, saad selle salvestada vaatena. Edaspidi teed päringu lihtsalt vaatest, mitte ei kirjuta pikka koodi uuesti.
3. **Andmete konsistents:** Muudatused alustabelites kajastuvad kohe ka vaates.

---

## Vaate loomise süntaks

```sql
CREATE VIEW vaate_nimi AS
SELECT veerg1, veerg2
FROM tabeli_nimi
WHERE tingimus;
```

# Näide 1: Lihtne vaade
Oletame, et sul on tabel kasutajad ja sa tahad näha ainult aktiivseid kasutajaid:

```sql
CREATE VIEW AktiivsedKasutajad AS
SELECT id, kasutajanimi, e_post
FROM kasutajad
WHERE staatus = 'aktiivne';
```

Nüüd saad seda vaadet pärida täpselt nagu tavalist tabelit


```sql
SELECT * FROM AktiivsedKasutajad;
```

# Vaate kustutamine
Kui sul pole vaadet enam vaja, saad selle eemaldada käruga DROP VIEW:


```sql
DROP VIEW vaate_nimi;
```



