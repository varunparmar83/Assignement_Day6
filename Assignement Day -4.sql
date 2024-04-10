select*
from Orders
where Order_ID in ('CA-2020-161389','US-2021-156909')
;
update Orders
set City=NULL
where Order_ID in ('CA-2020-161389','US-2021-156909')

--Finding nUll Values
select*
from Orders
where City is null --is not null

-- Aggregation Functions
 select Segment, count(*) as noof_orders,sum(Sales)as total_sales,max(Profit) as max_profit,min(sales) as min_sales
 from Orders
 
 --Group By
select Region, count(*) as cnt
,sum(Sales) as Total_Sales
,max(Sales) as Maximum_Sales
,min(Profit)as Minimum_Profit
,avg(Profit)as Average_Profit
from Orders
group by Region

--Having Calause
select Sub_Category,sum(sales) as Total_Sales
from Orders
group by Sub_Category
having sum(sales)>100000
order by Total_Sales desc


select Sub_Category,sum(sales) as Total_Sales
from Orders
group by Sub_Category
having MAX(Order_Date)>'2020-10-01'
order by Total_Sales desc
	 
select *
from Orders

--Count Function
select count(distinct(region)), count(city)
from orders