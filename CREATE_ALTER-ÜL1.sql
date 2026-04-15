create database idk;
use idk;

-- loome uue category(idcategory, , Category_Name)
CREATE TABLE Category(
idcategory int Primary Key identity(1,1),
Category_Name varchar(25) UNIQUE)

INSERT INTO Category
VALUES ('auto'),('jook'),('toit')
Select * FROM Category;

-- loome uue tabeli Product (idProduct, Name, idCategory, Price)
CREATE TABLE product(
idProduct int Primary Key identity(1,1),
Name varchar(25),
idCategory int,
Foreign key (idCategory) references Category(idCategory),
Price money)

INSERT INTO PRODUCT
VALUES ('Bigmac', 3, -55555 )

Select * FROM product;




-- loome uue tabeli Sale (idSale, idProduct, idCustomer, Count_pr, Date_of_sale)
CREATE TABLE SALE(
idSale int Primary Key identity(1,1),
idProduct int,
Foreign Key (idProduct) References Product(idProduct),
idCustomer int,
Count_pr int,
Date_of_sale date)

--loome uue tabeli Customer(idCustomer, name Contact) ja seosed
CREATE TABLE Customer(
idCustomer int primary Key identity(1,1),
name varchar(25) UNIQUE,
Contact varchar(100))

ALTER TABLE SALE add Foreign Key(idCustomer) references Customer(idCustomer)
INSERT INTO Customer
VALUES ('kevin', '+56745'),('Robin', '+34567')

SELECT * FROM CUSTOMER;
SELECT * FROM sale;


INSERT INTO Sale
VALUES (1, 1, 5, '2026-12-01')



