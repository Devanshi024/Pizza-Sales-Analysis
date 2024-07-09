-----KPIS---
select * from pizza_sales;
--1. Total Revenue : The sum of the total price of all pizza order
select Round(SUM(total_price),2) AS Total_Revenue from pizza_sales;

--2. Average order Value: The average amount spent per order
--total revenue / total no of order
--HERE WE ARE USING DISTINCT COZ SAME ORDER-ID IS REPETATING AGAIN AND AGAIN SO WE DONT NEED IT
select SUM(total_price) AS Total_Revenue, Count(DISTINCT order_id) AS Order_Count,
Round((SUM(total_price) / Count(DISTINCT order_id)),2) AS Average_order_value from pizza_sales

--3. Total Pizza Sold : The sum of the quantities of all pizza sold
select SUM(quantity) Quantity_Sold from pizza_sales;

--4. Total order : The total number of orders placed
select count(DISTINCT order_id) Total_order from pizza_sales

--5. Average_pizza per order : The average number of pizza sold per order,
--calculated by dividing the totalnoofpizzasold/totalnooforder
select Sum(quantity) AS Total_pizza_sold,
count(DISTINCT order_id) AS Total_order,
Round((SUM(quantity)/count(DISTINCT order_id)),2) AS Average_Pizza
from pizza_sales;
--------------------------------------PROBLEM STATEMNET-----------------
--1. Daily trend for Total orders : Day wise total order
Select DATENAME(DW,order_date) AS Order_Day,Count(Distinct order_id) Order_ID from pizza_sales
WHERE DATENAME(DW,order_date) IS NOT NULL
Group by DATENAME(DW,order_date)

--2. MONTH trend for Total orders : MONTH wise total order
Select DATENAME(MONTH,order_date) AS Order_Day,Count(Distinct order_id) Order_ID from pizza_sales
WHERE DATENAME(MONTH,order_date) IS NOT NULL
Group by DATENAME(MONTH,order_date)

--3. Percetange of total sales by category
Select pizza_category,Round((SUM(total_price) * 100)/
(SElect SUM(total_price) from pizza_sales),2) As Total_Sales_Percentage
from pizza_sales
Group by pizza_category;

--4.Percetange of total sales by Pizza_Size
Select pizza_size,Round(SUM(total_price) *100/(SELECT SUM(total_price) from pizza_Sales),2) AS Total_Sales_Percentage
from pizza_Sales
GROUP by pizza_size;

--5. Total Pizza sold by pizza category
Select pizza_category, SUM(quantity) AS Pizza_Sold from pizza_sales
Group by pizza_category;

--6.Top 5 best seller by revenue,total quantity,total order
select TOP 5 pizza_name,SUM(total_price) AS Total_Revenue,
SUM(quantity) AS Quantity_Sold, COUNT(DISTINCT order_id) AS Total_Order
from pizza_sales
Group by pizza_name
Order by Total_Revenue,Quantity_Sold,Total_Order DESC;

--WANT TO FIND BOTTOM 5 USE ASC




