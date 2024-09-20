CREATE DATABASE eda_supermarket;
USE eda_supermarket;

-- 1. Display the first 5 rows from the dataset.
SELECT 
    *
FROM
    supermarket
LIMIT 5;

-- 2. Display the last 5 rows from the dataset.
SELECT 
    *
FROM
    supermarket
ORDER BY `Invoice ID` DESC
LIMIT 5;

-- 3. Display random 5 rows from the dataset.
SELECT 
    *
FROM
    supermarket
ORDER BY RAND()
LIMIT 5;

-- 4. Display count, min, max, avg, and std values for a column in the dataset.
SELECT 
    COUNT(`gross income`),
    MIN(`gross income`),
    MAX(`gross income`),
    AVG(`gross income`),
    STD(`gross income`)
FROM
    supermarket;


-- 5. Find the number of missing values.
SELECT 
    COUNT(*)
FROM
    supermarket
WHERE
    Branch IS NULL;

-- 6. Count the number of occurrences of each city.
SELECT 
    City, COUNT(City)
FROM
    supermarket
GROUP BY City;

-- 7. Find the most frequently used payment method.
SELECT 
    Payment, COUNT(*)
FROM
    supermarket
GROUP BY Payment
ORDER BY COUNT(*) DESC;
-- 8. Does The Cost of Goods Sold Affect The Ratings That The Customers Provide? 
SELECT 
    Rating, cogs
FROM
    supermarket;

-- 9. Find the most profitable branch as per gross income.
SELECT 
    Branch, ROUND(SUM(`gross income`), 2) AS sum_gross_income
FROM
    supermarket
GROUP BY Branch
ORDER BY sum_gross_income DESC;

SELECT 
    City, Branch, SUM(`gross income`)
FROM
    supermarket
GROUP BY City , Branch;
-- 10.  Find the most used payment method city-wise.
SELECT 
    *
FROM
    supermarket;

SELECT 
    city,
    SUM(CASE
        WHEN Payment = 'Cash' THEN 1
        ELSE 0
    END) AS 'Cash',
    SUM(CASE
        WHEN Payment = 'Ewallet' THEN 1
        ELSE 0
    END) AS 'Ewallet',
    SUM(CASE
        WHEN Payment = 'Credit card' THEN 1
        ELSE 0
    END) AS 'Credit card'
FROM
    supermarket
GROUP BY City;

-- 11. Find the product line purchased in the highest quantity.
SELECT 
    `Product line`, SUM(Quantity)
FROM
    supermarket
GROUP BY `Product line`
ORDER BY SUM(Quantity) DESC;

-- 12. Display the daily sales by day of the week.
SELECT 
    *
FROM
    supermarket;
UPDATE supermarket 
SET 
    date = STR_TO_DATE(Date, '%m/%d/%Y');
SELECT 
    *
FROM
    supermarket;
SELECT 
    DAYNAME(date), DAYOFWEEK(date), SUM(Total)
FROM
    supermarket
GROUP BY DAYNAME(date) , DAYOFWEEK(date);
-- order by sum(Total) desc;

SELECT 
    MONTHNAME(date) AS name,
    MONTH(date) AS month,
    SUM(Total) AS total
FROM
    supermarket
GROUP BY name , month
ORDER BY total DESC;


-- 14. Find the time at which sales are highest.
SELECT 
    *
FROM
    supermarket;

SELECT 
    HOUR(Time) AS hour, SUM(Total) AS total
FROM
    supermarket
GROUP BY hour
ORDER BY total DESC;
-- 15. Which gender spends more on average?
SELECT 
    Gender, AVG(`gross income`)
FROM
    supermarket
GROUP BY Gender;