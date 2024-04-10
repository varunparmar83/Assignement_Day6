create table amazon_orders
(
order_id integer,
order_date date,
product_name varchar(100),
total_price decimal(6,2),
payment_method varchar(20)
);
--delete a table
drop table amazon_orders;

--DML -> data Manipulation language
insert into amazon_orders values(5,'2022-10-01 12:05:12','Shoes',132.5,'UPI');
insert into amazon_orders values(5,'2022-10-01 12:05:12',null,132.5,'UPI',10001);

select *
from amazon_orders;
-- alter the table change data type
alter table amazon_orders alter column order_date datetime
--Adding column in data set
alter table amazon_orders add username int;
alter table amazon_orders add category varchar(20)
-- Removing Column from data set
alter table amazon_orders drop column category
--CONSTRAINTS

--drp table
drop table a_orders;
create table a_orders
(
order_id integer NOT NULL ,--NOT NULL CONSTRAINS, UNIQUE CONSTRAINS, 
order_date date,
product_name varchar(100),
total_price decimal(6,2),
payment_method varchar(20) check (payment_method in ('UPI','CREDIT CARD')),--CHECK CONSTRAIN,
discount int check(discount<=20),--CHECK CONSTRAIN,
category varchar(20) default'Mens Wear'
primary key (order_id,product_name)
);
insert into a_orders values(2,'2022-10-01','Shoes',132.5,'UPI',20,'Kids Wear');
insert into a_orders values(3,'2022-10-01','Cap',134,'UPI',20,'Kids Wear');
insert into a_orders values(4,'2022-10-01','Hanker Chief',235,'UPI',20,'Kids Wear');
insert into
drop table a_orders;
---Delete With Filter condition -----DML
delete a_orders 
where product_name='shoes';
SELECT *
FROM a_orders
----Update The Data ----DML
update a_orders
set discount =19
where order_id=1 

