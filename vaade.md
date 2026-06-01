[Mõisted](README.md) | [Select laused](select.md) | [Kodutöö-keys](keys.md) | [Protseduurid](protseduur.md) | [Kasutaja loomine SQL Server](kasutaja.md) | [Kasutaja loomine XAMPP-is](kasutaja_xamp.md) | [Triggerid](triger.md)



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

# päris näide 
```
-- Create the database
CREATE DATABASE ronDB;
GO

-- Switch to your new database
USE ronDB;
GO


-- ========================================================
-- 2. Teeem tabeli
-- ========================================================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) NOT NULL
);
GO


-- ========================================================
-- 3. Tabelise paneme andmeid
-- ========================================================

INSERT INTO Employees (FirstName, LastName, Department, Salary, Status)
VALUES 
('Alice', 'Smith', 'IT', 85000.00, 'Active'),
('Bob', 'Jones', 'HR', 60000.00, 'Terminated'),
('Charlie', 'Brown', 'IT', 90000.00, 'Active'),
('Daisy', 'Miller', 'Sales', 55000.00, 'Active'),
('Ethan', 'Hunt', 'IT', 95000.00, 'On Leave');
GO


-- ========================================================
-- 4. Vaate, mis tahame saada, mis filteerib ära andmed ja annab need andmed, mida soovid saada
-- ========================================================

CREATE VIEW v_ActiveITEmployees AS
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    Department
FROM 
    Employees
WHERE 
    Status = 'Active' 
    AND Department = 'IT';
GO


-- ========================================================
-- 5. Testime vaateid
-- ========================================================

-- Look at the raw table data inside ronDB
SELECT * FROM Employees;

-- Look at your filtered view
SELECT * FROM v_ActiveITEmployees;
```
tavaline vaade


<img width="516" height="415" alt="{C65B8509-122C-4D37-A154-2CB8E8557641}" src="https://github.com/user-attachments/assets/0725c9b0-e30c-419b-8874-4159fdc6860c" />


filteeritud vaade ehk meie vaade, mis tahtsime saada


<img width="438" height="294" alt="{0143A448-F094-4B07-8AC4-10B323E207AD}" src="https://github.com/user-attachments/assets/eed6960d-4a11-459d-9947-82a4f6cd8fa1" />



