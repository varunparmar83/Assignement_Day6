--- Database Joins
select o.Order_ID,O.Product_ID,r.Return_Reason
from Orders o
inner join  returns r 
on o.Order_ID=r.Order_Id


select r.[Return_Reason],sum(sales) as Total_sales
from Orders o
left join  returns r 
on o.Order_ID=r.Order_Id
group by r.[Return_Reason]

create table people(
manager varchar(20),
Region varchar(10)
)


insert into people values
('Akit','West'),
('Deppak','East'),
('Vishal','Central'),
('Sanjay','South')

-- inner joins
select o.Order_ID,O.Product_ID,r.Return_Reason,p.manager
from Orders o
inner join  returns r 
on o.Order_ID=r.Order_Id
inner join  people p
on o.Region=p.Region