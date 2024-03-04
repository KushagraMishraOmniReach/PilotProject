create database ProjectDB;
use ProjectDB;

create table categories_info(
category_code int not null,
category_name varchar(255),
primary key(category_code)
);

create table products_info(
product_code varchar(255) not null,
product_category int,
product_description varchar(255),
primary key(product_code)
);

create table currency_info(
country_name varchar(100) not null primary key,
currency_code varchar(10)
);

create table stocks_info(
stocks_id int  auto_increment primary key,
product_code varchar(255),
location varchar(100),
inventory_available int 
);

create table prices_info(
prices_id int auto_increment primary key,
currency varchar(10),
price int,
product_code varchar(255)
);

insert into categories_info(category_code,category_name)
values (1000,'Classroom'),
(2000,'Blue'),
(3000,'Postcard'),
(4000,'Clips'),
(5000,'Bag');

insert into products_info(product_code,product_description,product_category)
values
('P118253',' EZC Reader Blue', 2000),
('P133070DLS',' Interlocking Hearts Pencil', 2000),
('P116871',' Return Sweep EZC Reader', 1000),
('P140388',' Welcome To School Bag Kit', 4000),
('P117229',' Ceiling Hanglers', 2000),
('P126357',' Love Bug Pencil Holder', 2000),
('P119405',' Collage Letters 9-Inch', 5000),
('P130398',' Write Again Dry Erase Boards Set of 12', 1000),
('P139737',' Stikki Clips', 1000),
('P125437',' Write Again Erasers', 1000),
('P116273',' Welcome Postcard', 3000),
('P129475DLS',' Royal Crowns', 3000),
('P121824',' Collage Letters 9-Inch', 1000),
('P118932',' Seasonal Stickers Assortment with Storage Box', 1000),
('P114411',' Return Sweep EZC Reader', 4000),
('P129361DLS',' EZC Reader Blue', 4000),
('P132507',' Interlocking Hearts Pencil', 5000),
('P100WS205',' Welcome To School Bag Kit', 4000),
('P113100',' Ceiling Hanglers', 4000);

insert into prices_info(product_code,price,currency)
values
('P116871',	10	,'USD'),
('P118253',	11,'USD'),
('P133070DLS',20,'USD'),
('P140388',13,	'USD'),
('P117229',	14,	'USD'),
('P126357',	15,	'USD'),
('P119405',	30,'USD'),
('P130398',31,	'USD'),
('P139737',	32,	'USD'),
('P125437',	33,	'USD'),
('P116273',	34,	'USD'),
('P129475DLS',	21,	'USD'),
('P121824',	58,	'USD'),
('P118932',	23,	'USD'),
('P114411',	24,	'USD'),
('P129361DLS',50,	'USD'),
('P132507',	54,	'USD'),
('P100WS205',21,	'USD'),
('P113100',	53,	'USD'),
('P119405',	100,	'INR'),
('P130398',	101	,'INR'),
('P139737',	102	,'INR'),
('P125437',	600,	'INR'),
('P116273',	104,	'INR'),
('P129475DLS',	100,	'INR'),
('P121824',	500,	'INR'),
('P118932',	501	,'INR'),
('P114411',	700	,'INR'),
('P129361DLS',	987,	'INR'),
('P132507',	51,	'INR'),
('P100WS205',	433,	'INR'),
('P113100',	234,	'INR');

insert into currency_info(country_name,currency_code)
values('INDIA','INR'),
('USA','USD');


insert into stocks_info(product_code,location,inventory_available)
values
('P116871',' USA', 101),
('P118253',' USA', 99),
('P133070DLS',' USA', 101),
('P140388',' USA', 1),
('P117229',' USA', 101),
('P126357',' USA', 101),
('P119405',' USA', 10000),
('P130398',' USA', 101),
('P139737',' USA', 874),
('P125437',' USA', 101),
('P116273',' USA', 25),
('P129475DLS',' USA', 101),
('P121824',' USA', 101),
('P118932',' USA', 5),
('P114411',' USA', 101),
('P129361DLS',' USA', 101),
('P132507',' USA', 101),
('P100WS205',' USA', 3),
('P113100',' USA', 0),
('P116871',' INDIA', 344),
('P118253',' INDIA', 99),
('P133070DLS',' INDIA', 101),
('P140388',' INDIA', 1),
('P117229',' INDIA', 101),
('P126357',' INDIA', 101),
('P119405',' INDIA', 1),
('P130398',' INDIA', 101),
('P139737',' INDIA', 874),
('P125437',' INDIA', 101),
('P116273',' INDIA', 0),
('P129475DLS',' INDIA', 101),
('P121824',' INDIA', 65),
('P118932',' INDIA', 500),
('P114411',' INDIA', 101),
('P129361DLS',' INDIA', 4),
('P132507',' INDIA', 101),
('P100WS205',' INDIA', 3),
('P113100',' INDIA', 0);

select * from currency_info;
select * from stocks_info;
with temp as (select distinct p.product_code,p.product_description,p.product_category,
c.category_name,s.location,s.inventory_available,pi.currency,pi.price
from products_info p inner join stocks_info s on p.product_code=s.product_code
left join currency_info ci on 1=1
left join categories_info c on p.product_category=c.category_code
left join prices_info pi on pi.product_code=s.product_code and pi.currency=ci.currency_code
 order by product_code DESC)
select *,(select count(*)  from temp) as totalRecords from temp
