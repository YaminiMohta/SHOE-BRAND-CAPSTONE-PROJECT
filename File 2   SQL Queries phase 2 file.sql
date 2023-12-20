show databases;
create database datascience;
use datascience;
create database CapstoneTable1;
show databases;
use CapstoneTable1;

#TABLE 1 - 1 Write a query  to retrieve all shoe names and their corresponding prices for men's shoes:

select * from Table1;
select Shoename, Shoe_Price
from Table1
where Category = "Men";

#2 Write a query to retrieve the number of different colors available for each category-

SELECT category, COUNT(DISTINCT color) AS num_colors
FROM products
GROUP BY category;

#3 Write a query to find the most expensive men's shoe-

Select max(Shoe_Price) from Table1 where Category= "Men";

#4 Write a query to find the cheapest women's shoe in a specific color (e.g., 'Black ')-

select Shoename, Shoe_Price from table1 where Category = 'women' and colour = 'Black' order by price limit 1;

#5 Write a query to retrieve all shoe names and their corresponding prices for men's shoes-

select Shoename, Shoe_Price from table1 where Category = "Men";


#Table 2 - 1 Write a query that retrieves the count of sizes for all styles-

show databases;
use CapstoneTable1;
select * from Table2;
select Style_codeProduct_code, count(CountOfSizes) from table2 group by Style_codeProduct_code;

#2  Write a query to list all styles with their associated colors-

Select Color1, Color2, Color3, Color4, Color5, Style_codeProduct_code from table2;

#3 Write a to find styles that have more than one color-

SELECT Style_codeProduct_code from table2 where Color2="NA";

#4  Write a query to find the count of sizes available for each color for a specific style code-

show databases;
use CapstoneTable1;


#5  Write a query to find styles that have a specific color-

show databases;
use CapstoneTable1;
Select Style_codeProduct_code from table2 where Color1="Black" or Color2= "Black" or Color3= "Black" or Color4= "Black" or Color5= "Black";



#Table 3 - 1 Write a query calculates the average comfort rating for a specific product based on its reviews-

show databases;
use CapstoneTable1;
select * from Table3;
select AVG(Comfort) as avg_Comfort from Reviews;

#2  Write a query to retrieve products with high star ratings (e.g., 4 stars or above)-

Select * from Table3 where Star_rating>=4;

#3 Write a query that counts the number of reviews for each product.

Select Reviews from Table3;

#4  Write a To retrieve products that have a quantified durability/quality/performance rating above a certain threshold (e.g., above 7)-

select Durability_quality_performance from table3 where Durability_quality_performance>7;

#5 Write a query that  calculates the average comfort rating for each size-

select Size, AVG(Comfort) AS avg_Comfort FROM table3 GROUP BY Size;


#7  Join SQL Queries  using all 3 tables: Number 1-

show databases;
use CapstoneTable1;
Select Table1.Shoename, Table3.Size from Table1 JOIN Table3 on Table1.Shoename = Table3.Star_rating Where Table1.Category="Men"
ORDER BY Table3.Star_rating DESC;

#Number 2-

show databases;
use CapstoneTable1;
SELECT Table3.Comfort, AVG(Table1.Category) AS avg_Comfort from Table1 JOIN Table3 ON Table1.Category=Table3.Comfort GROUP BY Table3.Comfort;

#Number 3-

show databases;
use CapstoneTable1;
select *from table1;
select * from table3;
SELECT Table1.Shoename, Table3.Durability_quality_performance FROM Table1 JOIN Table3 ON Table1.Shoename = Table3.Durability_quality_performance;

#Number 4-

show databases;
use CapstoneTable1;
select *from table1;
select * from table3;
SELECT table1.Shoename, table3.Comfort FROM table1 JOIN table3 where Comfort="Very Comfortable" or "Highly Comfortable";

#Number 5-

SELECT table1.Shoename, table2.Style_codeProduct_code FROM table1 JOIN table2;

#Number 6-

show databases;
use CapstoneTable1;
select *from table1;
select * from table3;
SELECT table1.Shoename, table3.Star_rating, table3.Size FROM table1 JOIN table3 where Star_rating>=4;

#Number 7-

SELECT table1.Category, table3.Comfort FROM table1 JOIN table3 where Comfort="Very Comfortable" or "Highly Comfortable";

#Thank you :)