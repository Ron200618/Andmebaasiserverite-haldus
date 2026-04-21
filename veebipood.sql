create database SALES;
use SALES;

-- customers

create table customers(
customer_ID int primary key identity(1, 1),
first_name varchar(25)not null,
last_name varchar(30) not null,
phone char(13),
email varchar(25) not null,
street varchar(25),
City varchar(25),
state varchar(25),
zip_code char(5))


SELECT * FROM customers

insert into customers
values ('mart', 'siid', '5563431', 'priit@gmail.com', 'jahu 12', 'Tallinn', 'Harjumaa', '1141')

--table stores
create table stores(
store_id int primary key identity(1, 1),
store_name varchar(25) not null,
phone char(13),
email varchar(25) not null,
street varchar(25),
City varchar(25),
state varchar(25),
zip_code char(5))

Select * from stores
insert into stores
Values ('Giga pood', '568033', 'gigapood@gmail.com', 'essadma 12', 'Tartu', 'Tartumaa', 11513)





--orders

create table orders(
order_id int primary key identity(1, 1),
customer_id int,
foreign key (customer_id) references customers(customer_ID),
order_status varchar(10) check(order_status = 'tehtud' or order_status = 'tegematta'),
order_date date,
required_date date not null,
shipped_date date,
store_id int, Foreign key(store_id) references stores(store_id),
staff_id int, Foreign key(staff_id) references staff(staff_id))

select * from orders
select * from stores
select * from staff
select * from customers

insert into orders
values (1,'tehtud', '2026-04-21', '2026-05-10', '2026-05-01', 1,1)


--tabel staff

create table staff(
staff_id int primary key identity(1, 1),
first_name varchar(25) not null,
last_name varchar(30) not null,
email varchar(25),
phone char(5),
active bit,
store_id int,
foreign key (store_id) references Stores(store_id),
manager_id bit)

select * from staff

insert into staff
values ('Chad', 'Giga', 'Gigachad@gmail.com', 112, 1, 2, 2)

-- tabel order_items

create table order_items(
order_id int,
foreign key (order_id) references orders(order_id),
item_id int,
product_id int,
foreign key (product_id) references products(product_id),
primary key (order_id, item_id),
quanity int,
list_price money,
discount int)

select * from order_items
select * from products
select * from orders

insert into order_items
values (1, 1, 1, 50, 100, 100)

-- PRODUCTION ---------------------------

-- brands

create table brands(
brand_id int primary key identity(1,1),
brand_name varchar(25) unique)


insert into brands
values ('Abibas')

Select * from brands

create table categories(
category_id int Primary key identity (1,1),
category_name varchar(25) unique)

insert into categories
values ('juust')

select * from categories

-- tabel products
create table products(
product_id int primary key identity(1,1),
product_name varchar(25) unique,
brand_id int,
foreign key (brand_id) references brands(brand_id),
category_id int,
foreign key (category_id) references categories(category_id),
model_year int,
list_price money)

select *from products
select *from brands
select *from categories

insert into products
values ('jooksu püksid', 2,2, 2026,15.50)

--tabel stocks
create table stocks(
store_id int,
product_id int,
primary key( store_id, product_id),
foreign key (store_id) references stores(store_id),
foreign key (product_id) references products(product_id),
quanity int)

select * from stores
select * from products

insert into stocks
values (1, 1, 100), (1, 2, 30)
select * from stocks

