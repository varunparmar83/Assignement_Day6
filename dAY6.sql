select *
from employee
select *
from dept
--EMPLOYEES AND THERE MANAGERS NAMES
select e.emp_id,e.emp_name,j.emp_name as manager_name
from employee e
inner join  employee j
on e.manager_id=j.emp_id

--EMPLOYES WHOSE SALARIES MORE THAN THERE MANAGERS
select e.emp_id,e.emp_name,e.salary
from employee e
inner join  employee j
on e.manager_id=j.emp_id
where e.salary>j.salary
select *
from employee

--STRING AFFGREGATION FUNCTION ******STRING_AGG*******
select dept_id,STRING_AGG(emp_name ,',') within group (order by emp_name )as List_of_employees
from employee
group by dept_id

--Date Function*****DATEPART*******
select Order_ID,Order_Date,DATEPART(year,Order_Date) as Order_Year
from Orders
--Using with where condition
select Order_ID,Order_Date,DATEPART(year,Order_Date) as Order_Year,DATENAME(WEEKDAY,Order_Date) as order_day
,DATENAME(month,Order_Date) as Order_Month_Name--Datename****
from Orders
where DATEPART(year,Order_Date)=2020


---*******DATENAME******* ADDING DAYS AND YEARS ,MONTHS ,WEEKS
select Order_Date,Ship_Date, DATEADD(YEAR,5,Ship_Date) as shipping_delay
from Orders

---*******DATENAME******* SUBTRACTING DAYS AND YEARS ,MONTHS ,WEEKS
select Order_Date,Ship_Date, DATEADD(YEAR,-5,Ship_Date) as shipping_delay
from Orders