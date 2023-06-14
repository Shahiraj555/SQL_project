SELECT count(*) FROM pizza_db.pizza_sales;

select * from pizza_sales;


-- TOTAL REVENUE
select round(sum(total_price),2) as Total_Revenue from pizza_sales;


-- Average Order Value
SELECT round(sum(total_price) / count(distinct order_id),2) as Avg_Order_Value
 from pizza_sales;
 
 
--  Total Pizza Sold
 select sum(quantity) as Total_Pizza_sold from pizza_sales;
 
-- Total Order id 
 select count(distinct(order_id)) as Total_Orders from pizza_sales;
 
-- Average Pizza Per Order
select round(sum(quantity) / count(distinct(order_id)),2) as Avg_pizza_per_order
from pizza_sales;


-- Daily Trend For Total Order
 select dayname(order_date) as Order_day,count(distinct order_id) as Total_order
 from pizza_sales
 group by dayname(order_date)
 order by dayname(order_date)  desc;
 
 
-- Hourly Trend For Total Order
select hour(order_time) as Hourly_trend,count(distinct order_id) as Total_order
from pizza_sales
group by hour(order_time)
order by  hour(order_time);


-- Percentage of Total Pizza Sold By Category
select pizza_category, round(sum(total_price)*100 / (select sum(total_price) from pizza_sales),2)
as 
Per_Total_sales from pizza_sales
group by pizza_category;


-- Percentage of Sale by Pizza Size
select pizza_size, round(sum(total_price)*100 / (select sum(total_price) from pizza_sales),2)
as 
Per_sales_by_pizza_size from pizza_sales
group by pizza_size
order by Per_sales_by_pizza_size desc;


-- Total Pizza Sold By Pizza Category
select pizza_category,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_category;


-- Top 5 Best Seller By Total Pizza Sold
select pizza_name,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_name
order by Total_pizza_sold desc limit 5;


-- Top 5 Worst Seller By Total Pizza Sold
select pizza_name,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_name
order by Total_pizza_sold asc limit 5;


