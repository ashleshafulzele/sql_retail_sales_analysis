CREATE DATABASE retail;

USE retail; 

SHOW TABLES;
SET SQL_SAFE_UPDATES = 0;
SELECT * 
FROM `sql - retail sales analysis_utf`;

ALTER TABLE `sql - retail sales analysis_utf`
RENAME retail_sales;

SELECT * FROM retail_sales;

SELECT COUNT(*) FROM retail_sales;

-- To check NULL Values
ALTER TABLE retail_sales
CHANGE `ï»¿transactions_id` transactions_id INT;

-- Data Cleaning

SELECT * FROM retail_sales 
WHERE transactions_id IS NULL;

SELECT * FROM retail_sales 
WHERE sale_date IS NULL;

SELECT * FROM retail_sales 
WHERE 
transactions_id IS NULL OR
sale_date IS NULL OR
sale_time IS NULL OR
customer_id IS NULL OR
gender IS NULL OR
age IS NULL OR
category IS NULL OR
quantiy IS NULL OR
price_per_unit IS NULL OR
cogs IS NULL OR
total_sale IS NULL ;

DELETE FROM retail_sales
WHERE 
transactions_id IS NULL OR
sale_date IS NULL OR
sale_time IS NULL OR
customer_id IS NULL OR
gender IS NULL OR
age IS NULL OR
category IS NULL OR
quantiy IS NULL OR
price_per_unit IS NULL OR
cogs IS NULL OR
total_sale IS NULL ;

-- DaTA Exploration

-- How many sales we have
SELECT COUNT(*) AS total_sales FROM retail_sales ;

-- How many coustomer we have
SELECT COUNT(customer_id) AS total_sales FROM retail_sales ;

-- How many unique coustomer we have
SELECT COUNT(DISTINCT customer_id) AS total_sales FROM retail_sales ;

SELECT COUNT(DISTINCT category) AS total_sales FROM retail_sales;

SELECT DISTINCT category FROM retail_sales;

-- DATA ANALYSIS

-- Retrieve all columns for sales made on 2022-11-05
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT COUNT(*) 
FROM retail_sales 
WHERE DATE(sale_date) = '2022-11-05';

SELECT *
FROM retail_sales
WHERE DATE(sale_date) = '2022-11-05';

-- Retrieve all transactions where the category is ‘Clothing’ and the quantity sold is more than 10 in the month of November 2022.

SELECT * FROM retail_sales
WHERE category = "clothing" AND 
quantiy > 2  AND
sale_date BETWEEN '2022-11-01' AND '2022-11-30';

-- Calculate the total sales (total_sale) for each category.

SELECT COUNT(*) total_sale FROM retail_sales
GROUP BY category;

SELECT category, SUM(total_sale) -- real answer
AS total_sales, 
COUNT(*)
FROM retail_sales
GROUP BY category;

-- Find the average age of customers who purchased items from the ‘Beauty’ category.

SELECT AVG(age) AS avg_age
FROM retail_sales
WHERE category = "Beauty";

-- Find all transactions where the total_sale is greater than 1000.

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Find the total number of transactions (transaction_id) made by each gender in each category.

SELECT gender, category, COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY gender, category;

-- Calculate the average sale for each month, and identify the best-selling month in each year.

SELECT year, month, avg_sale
FROM (
SELECT 
YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
AVG(total_sale) AS avg_sale,
RANK() OVER (
PARTITION BY YEAR(sale_date)
ORDER BY AVG(total_sale) DESC
) AS rnk
FROM retail_sales
GROUP BY 
YEAR(sale_date),
MONTH(sale_date)
) t
WHERE rnk = 1;

-- Find the top 5 customers based on the highest total sales.

SELECT customer_id, 
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Find the number of unique customers who purchased items from each category.
SELECT category,
COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Create shifts based on sale_time and count number of orders per shift
-- Morning,Afternoon,Evening

SELECT 
CASE
WHEN HOUR(sale_time) < 12 THEN 'Morning'
WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS shift,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;



































































































































































































































































































































































































