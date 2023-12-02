create database End_Capstone2;
use End_Capstone2;
select * from dbo.supermarket_sales;


/*The top 5 rows */
SELECT TOP 5 * FROM supermarket_sales;


/*Summary statistics for numerical columns:*/
SELECT
    AVG(Unit_price) AS avg_unit_price,
    AVG(Quantity) AS avg_quantity,
    MIN(Total) AS min_total,
    MAX(Total) AS max_total,
    AVG(Rating) AS avg_rating
FROM supermarket_sales;


/*Distribution*/
SELECT Product_line, COUNT(*) AS Count FROM supermarket_sales
GROUP BY Product_line ORDER BY count DESC;


/*Total sales by Branch*/
SELECT Branch, SUM(Total) AS total_sales FROM supermarket_sales
GROUP BY Branch;


/*Filter data based on specific criteria, such as high-rated products:*/
SELECT * FROM supermarket_sales
WHERE Rating >= 4.5;


/*Analyze sales trends over time:*/
SELECT
    DATEPART(year, Date) AS sales_year,
    DATEPART(month, Date) AS sales_month,
    SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY DATEPART(year, Date), DATEPART(month, Date)
ORDER BY sales_year, sales_month;


/*Customer Gender Analysis:*/
SELECT Gender, COUNT(*) AS count FROM supermarket_sales
GROUP BY Gender;


/*Customer Type Analysis:*/
SELECT [Customer_type], COUNT(*) AS count FROM supermarket_sales
GROUP BY [Customer_type];


/*the overall sales data indicate variance between the branches i.e 
1. There is not much difference in sales across the 3 branches of A, B and C. 
2. The sales in branch A is a bit higher than the rest of the branches.*/
select Branch, count(*) as Counts from supermarket_sales 
group by Branch order by Branch;


/*The payment method do customers predominantly favor i.e
1. In reality, the favored payment method is E-wallet, surpassing credit cards. 
2. Cash payments are also quite commonly used.*/
select Payment, count(*) as Counts from supermarket_sales 
group by Payment order by Counts desc;


/*The spending trends for both females and males, and in which category do they tend to allocate a significant portion of their spending are i.e
1. Among females, the highest expenditure is on ‘fashion accessories’, while for males, it is ‘Health and beauty’.
2. Additionally, females allocate a greater portion of their spending towards ‘Food and beverages’ compared to males.*/
select Product_line, Gender, count(*) as Counts from supermarket_sales 
group by Product_line, Gender order by Counts desc;


/*The product line should the supermarket prioritize i.e
1. While the ratings for ‘Health and beauty’ is notably high, the quantity purchased remains relatively low. 
2. Therefore, there is a need to augment the supply of this product.*/
select Product_line, count(*) as Quantity, 
round((SUM(Rating)/ count(*)), 2) as Avg_Rating 
from supermarket_sales group by Product_line;


/*city should be selected for expansion, and which specific products should be the primary focus i.e
1. It’s evident that Naypyitaw stands out as the most lucrative city. 
2. Therefore, the expansion strategy should be centered around this city.*/
select City, sum(gross_income) as gross_income_of_city from supermarket_sales 
group by City order by gross_income_of_city desc;


/*Let’s examine the products sold in ‘Yangon’ i.e
1. ‘Home and lifestyle’ and ‘Electronic accessories’ emerge as the highest-selling products in Yangon. 
2. It is advisable to prioritize these products for expansion, along with giving attention to ‘Sports and Travel’.*/
select Product_line, count(*) as Counts from supermarket_sales 
where city = 'Yangon' group by Product_line order by Counts desc;

select product_line, count(*) as Counts from supermarket_sales 
where city = 'Naypyitaw' group by Product_line order by Counts desc;

select product_line, count(*) as Counts from supermarket_sales 
where city = 'Mandalay' group by Product_line order by Counts desc;






