create database End_Capstone1;
use End_Capstone1;
select * from dbo.Branded_Laptops;

/*1. Data Overview:*/
SELECT TOP 10 * FROM Branded_Laptops;


/*2. Data Summary Statistics:*/
SELECT
    COUNT(*) AS Total_laptops,
    AVG(laptop_prices) AS Average_price,
    MIN(laptop_prices) AS Min_price,
    MAX(laptop_prices) AS Max_price,
	AVG(laptop_reviews) AS Avg_reviews
FROM Branded_Laptops;


/*3. Data Distribution:*/
SELECT ROUND(laptop_prices, -2) AS Price_range, COUNT(*) AS count
FROM Branded_Laptops
GROUP BY ROUND(laptop_prices, -2)
ORDER BY price_range;


/*4. The top-rated laptop models:*/
SELECT Top 5 laptop_names, laptop_reviews
FROM Branded_Laptops
ORDER BY laptop_reviews DESC; 


/*5. Laptops with high prices or high reviews:*/
SELECT *
FROM Branded_Laptops
WHERE laptop_prices > 50000
AND laptop_reviews > 50;


/*6. Price Range Analysis:*/
SELECT
    CASE
        WHEN laptop_prices < 25000 THEN 'Low'
        WHEN laptop_prices >= 25000 AND laptop_prices < 50000 THEN 'Medium'
        ELSE 'High' 
    END , COUNT(*) AS Count FROM Branded_Laptops
GROUP BY CASE
        WHEN laptop_prices < 25000 THEN 'Low'
        WHEN laptop_prices >= 25000 AND laptop_prices < 50000 THEN 'Medium'
        ELSE 'High' 
    END ;


/*7. Data by laptop brand to see statistics for each brand:*/
SELECT
    LEFT(laptop_names, CHARINDEX(' ', laptop_names) - 1) AS Laptop_Brand,
    AVG(laptop_prices) AS Average_Price,
    AVG(laptop_reviews) AS Average_Review_Rating
FROM Branded_Laptops
GROUP BY LEFT(laptop_names, CHARINDEX(' ', laptop_names) - 1)
ORDER BY laptop_brand;


/*8. Price Distribution:*/
SELECT
    FLOOR(laptop_prices / 100) * 100 AS price_range,
    COUNT(*) AS laptop_count
FROM Branded_Laptops
GROUP BY FLOOR(laptop_prices / 100) * 100
ORDER BY price_range;


/*9. Review Analysis:*/
SELECT
    laptop_reviews,
    COUNT(*) AS review_count FROM Branded_Laptops
GROUP BY laptop_reviews
ORDER BY laptop_reviews;


/*10. Data Quality Check:*/
SELECT
    COUNT(*) AS total_laptops,
    SUM(CASE WHEN laptop_prices IS NULL OR laptop_reviews IS NULL THEN 1 ELSE 0 END) AS missing_data_count
FROM Branded_Laptops;








