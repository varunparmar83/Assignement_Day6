--1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
update Orders
set City=NULL
WHERE Order_ID in('CA-2020-161389' , 'US-2021-156909')

--2- write a query to find orders where city is null
select *
from Orders
where city is NULL
--write a query to get total profit, first order date and latest order date for each category
select Category,sum(Profit) as Total_Profit,min(Order_Date) as First_Order_Date,max(Order_Date) as Last_Order_Date
from Orders
group by category

--4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
select Sub_Category
from Orders
group by Sub_Category
having avg(profit)>max(profit)/2
--5- create the exams table with below script; create table exams (student_id int, subject varchar(20), marks int)
create table exams(student_id int
,subject varchar(20)
,marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);
--write a query to find students who have got same marks in Physics and Chemistry.
select student_id , marks
from exams
where subject in ('Physics','Chemistry')
group by student_id , marks
having count(1)=2

--6- write a query to find total number of products in each category.
select category,count(distinct(Product_id))
from Orders
group by Category

--7- write a query to find top 5 sub categories in west region by total quantity sold
select top 5 Sub_Category,sum(Quantity) as Total_Quantity
from Orders
where Region='West'
group by Sub_Category
order by Total_Quantity desc

--write a query to find total sales foe each region  and shop mode  in year 2020
select Region,Ship_Mode,sum(Sales) as Total_Sales
from Orders
where Ship_Date between '2020-01-01' and '2020-12-31'
group by Region,Ship_Mode