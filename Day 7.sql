----STRING FUNCTIONS
--1 LEN
 select len(customer_name)
 from Orders
 --Left
 select Customer_Name,LEFT(Customer_Name,5)
 from Orders
--Right
 select Customer_Name,Right(Customer_Name,5)
 from Orders

 --SUNSTRING
 select Customer_Name,SUBSTRING(Customer_Name,2,3),SUBSTRING(Customer_Name,1,7) as Name
 from Orders

 --CHARINDEX
 select Customer_Name, CHARINDEX('n',Customer_Name,1) as Fist_Position,
 CHARINDEX('n',Customer_Name,8) as Fist_Position,
 CHARINDEX('n',Customer_Name,3) as Fist_Position
 from Orders

 --CONCAT
 select  CONCAT(State, '-->',City) city_info
 from Orders
-- REPLCAE FUNCTION
select Order_ID,Customer_Name,replace(Order_ID,'CA','IND') AS Replace_Id
from Orders

-- TRANSLATE FUNCTION
select Order_ID,Customer_Name,TRANSLATE(Customer_Name,'C','V') AS Translated
from Orders

--Null Handling Finction
select Order_ID,City
from Orders
where City is null