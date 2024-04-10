                     --ASSIGNEMENT DAY 4--
--1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
update Orders set City = NULL
where Order_ID in ('CA-2020-161389','US-202021-156909')

--2- write a query to find orders where city is null (2 rows)
SELECT *
FROM Orders WHERE City is null

-- 3 write a query to get total profit, first order date and latest order date for each category
select sum(profit) as Total_proft, MIN(order_date) as Fisrt_orderDate
from Orders
group by Category

-- 
--4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
select Sub_Category
from Orders
group by Sub_Category
having  avg(Profit) >max(Profit)/2

--5- create the exams table with below script;
create table Examse (student_id int, subject varchar(20), marks int);

insert into Examse values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

select *
from Examse

--write a query to find students who have got same marks in Physics and Chemistry.
select student_id,marks
from Examse
where subject in ('Physics','Chemistry')
group by student_id,marks
having count(1)=2

--6- write a query to find total number of products in each category.
select Category,count(distinct(product_id)) as Total_products
from Orders
group by Category

--7- write a query to find top 5 sub categories in west region by total quantity sold
select top 5  sub_category, sum(quantity) as total_quantity
from orders
where region='West'
group by sub_category
order by total_quantity desc

--8  write a query to find total sales for each region and ship mode combination for orders in year 2020
select Region,Ship_Mode,sum(sales) as Total_sales
from Orders
where Order_Date between '2020-01-01' and '2020-12-31'
group by Region,Ship_Mode

--9 