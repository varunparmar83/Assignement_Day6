select top 5*
from Orders;

--To get Distinct Value from column
select distinct(Ship_Mode)
from Orders

--
select distinct Ship_Mode,segment
from Orders;
--filter
select *
from Orders
where Ship_Mode='First Class';

select *
from Orders
where Order_Date='2020-12-08'

select *
from Orders
where quantity =5


select *
from Orders
where quantity=5 or order_date<'2020-11-08'--Filtering data and You increasing more rows

select *
from Orders
where quantity=5 and order_date<'2020-11-08'--Filtering data and You decreaing Rows	

select cast(profit/sales as varchar) as ratio
from Orders
order by ratio asc 

---Pattern Matching  --> It will give customer's name whose start with C
select order_id,order_date,customer_name
from Orders
where customer_name like 'C%'
--It will give name start with c but second character either a or l
select order_id,order_date,customer_name
from Orders
where customer_name like 'C[al]%'
-- It will give name start with c But second character should not be a nd c
select order_id,order_date,customer_name
from Orders
where customer_name like 'C[^al]%'
--It will give name start with c  and second chracter between range (a to x)
select order_id,order_date,customer_name
from Orders
where customer_name like 'C[a-x]%'