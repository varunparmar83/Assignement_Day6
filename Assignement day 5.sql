--****************Day 5 Assignement****************
--1- write a query to get region wise count of return orders
select o.Region,count(distinct r.Order_Id) as Retun_Orders
from Orders o
inner join returns r
on o.Order_ID=r.Order_Id
group by o.Region

--2- write a query to get category wise sales of orders that were not returned
select o.Category,sum(sales) as sales_of_orders_notreturn
from Orders o
left join returns r
on o.Order_ID=r.Order_Id
where r.Order_Id is null
group by o.Category

--3 write a query to print dep name and average salary of employees in that dep .
select*
from employee
select*
from dept

select d.dep_name,avg(e.salary) as average_salary
from employee e
inner join dept d
on e.dept_id=d.dep_id
group by d.dep_name
--group by d.dep_name
--having count(e.emp_id)=count(distinct e.salary)


--4 write a query to print dep names where none of the emplyees have same salary.

select e.dept_id,d.dep_name
from employee e
left  join dept d on e.dept_id=d.dep_id
group by d.dep_name,e.dept_id
having count(distinct(e.salary) )= count(1)

select*
from employee
select*
from dept


--5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
select*from
Orders
select *
from returns

select o.Sub_Category
from Orders o
inner join returns r
on o.Order_Id=r.Order_ID
group by o.Sub_Category
having count(distinct r.Return_Reason)=3

--6- write a query to find cities where not even a single order was returned.
select o.City
from Orders o
left join returns r
on o.Order_ID=r.Order_Id
group by o.City
having count(r.Order_Id)=0


--7- write a query to find top 3 subcategories by sales of returned orders in east region
select top 3 o.Sub_Category, sum(o.Sales) as return_sales
from returns r 
left join Orders o
on o.Order_ID=r.Order_Id
where o.Region='East'
group by o.Sub_Category
order by return_sales desc

--8- write a query to print dep name for which there is no employee
select d.dep_name,d.dep_id
from dept d 
left join employee e
on e.dept_id=d.dep_id
group by d.dep_name,d.dep_id
having count(e.emp_id)=0

--9- write a query to print employees name for which dep id is not avaiable in dept table
select e.*
from employee e
left join dept d
on e.dept_id=d.dep_id
where d.dep_id is null

