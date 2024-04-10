--*******Day 6 Assignement************
--1- write a query to print emp name , their manager name and diffrence in their age (in days) 
--for employees whose year of birth is before their managers year of birth
alter table  employee add dob date;
update employee set dob = dateadd(year,-1*emp_age,getdate())

select e1.emp_name,e2.emp_name as manager_name , DATEDIFF(day,e1.dob,e2.dob) as diff_in_age
from employee e1
inner join employee e2 on e1.manager_id=e2.emp_id
where DATEPART(year,e1.dob)< DATEPART(year,e2.dob)
;
--2- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)
select o.Sub_Category
from Orders o
left join returns r
on o.Order_ID=r.Order_Id
where DATEPART(MONTH,o.Order_Date)=11
group by Sub_Category
having count(r.order_id)=0
--3- orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
select Order_ID
from Orders
group by Order_ID
having COUNT(1)>1
--4- write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him.
select e2.emp_name as manager_name , string_agg(e1.emp_name,',') as emp_list
from employee e1
inner join employee e2 on e1.manager_id=e2.emp_id
group by e2.emp_name
--5- write a query to get number of business days between order_date and ship_date (exclude weekends). 
select Order_ID,Ship_Date,Order_Date,DATEDIFF(DAY,Order_Date,Ship_Date)-2*DATEDIFF(WEEK,Order_Date,Ship_Date)
from Orders
--6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)
select o.Category,SUM(o.Sales) AS Total_Sales_Orders,Sum( case when r.Return_Reason is not null then Sales end) as return_orders_sales
from Orders o
left join returns r
on o.Order_ID=r.Order_Id
group by o.Category
--7- write a query to print below 3 columns category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020
SELECT 
    Category,
    SUM(CASE WHEN DATEPART(year, Order_Date) = 2019 THEN sales end) AS sales_2019,
    SUM(CASE WHEN DATEPART(year, Order_Date) = 2019 THEN sales end) AS sales_2020

FROM 
    Orders 
GROUP BY 
    Category;
--8- write a query print top 5 cities in west region by average no of days between order date and ship date.
select top 5 city, avg(datediff(day,order_date,ship_date) ) as avg_days
from orders
where region='West'
group by city
order by avg_days desc