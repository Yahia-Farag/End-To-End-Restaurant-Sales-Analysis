USE Restaurant_Sales;

-- ==========================================
-- 1. DATA EXPLORATION & OVERVIEW
-- ==========================================

-- Get the total row count of the dataset
SELECT COUNT(*) AS Total_Rows 
FROM restaurant_sales_data;

-- Preview the first 20 rows to understand the data structure
SELECT TOP 20 * 
FROM restaurant_sales_data;

-- ==========================================
-- 2. DATA QUALITY & MISSING VALUES CHECK
-- ==========================================

-- Check for missing (NULL) values across all critical columns using conditional aggregation
SELECT SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customers, -- 0
       SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Missing_Category, -- 0
       SUM(CASE WHEN Item IS NULL THEN 1 ELSE 0 END) AS Missing_Item, -- 1758
       SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS Missing_Price, -- 876
       SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity, -- 430
       SUM(CASE WHEN Order_Total IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Total, -- 430
       SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Date, -- 0
       SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Missing_Payment -- 1082
FROM restaurant_sales_data;

-- ==========================================
-- 3. DUPLICATES & ANOMALIES CHECK
-- ==========================================

-- Check for duplicate Order IDs to ensure unique transactions
SELECT Order_ID,
       COUNT(*) AS Count_Duplicates
FROM restaurant_sales_data
GROUP BY Order_ID
HAVING COUNT(*) > 1
ORDER BY Count_Duplicates DESC;

-- Check for illogical negative quantities (Data sanity check)
SELECT *
FROM restaurant_sales_data
WHERE Quantity < 0;

-- Check for illogical negative prices (Data sanity check)
SELECT *
FROM restaurant_sales_data
WHERE Price < 0;

-- ==========================================
-- 4. CLEANING & HANDLING MISSING DATA
-- ==========================================

-- Inspect rows where the Item column is missing
SELECT * 
FROM restaurant_sales_data
WHERE Item IS NULL;

-- Identify completely empty rows where all core transactional metrics are NULL
SELECT * 
FROM restaurant_sales_data
WHERE Item IS NULL
  AND Price IS NULL 
  AND Quantity IS NULL
  AND Order_Total IS NULL
  AND Payment_Method IS NULL;

-- Delete completely empty rows that contain no valid transaction data
DELETE FROM restaurant_sales_data
WHERE Item IS NULL
  AND Price IS NULL 
  AND Quantity IS NULL
  AND Order_Total IS NULL
  AND Payment_Method IS NULL;

-- Inspect rows with missing pricing metrics
SELECT * 
FROM restaurant_sales_data
WHERE Price IS NULL
  AND Quantity IS NULL
  AND Order_Total IS NULL;

-- Analyze total orders per customer to understand order distribution
SELECT Customer_ID,
       COUNT(Order_ID) AS Total_Orders
FROM restaurant_sales_data
GROUP BY Customer_ID
ORDER BY Total_Orders DESC;

-- Analyze orders per customer where all primary fields are completely NULL
SELECT Customer_ID,
       COUNT(Order_ID) AS Total_Orders
FROM restaurant_sales_data
WHERE Price IS NULL
  AND Quantity IS NULL
  AND Order_Total IS NULL
  AND Item IS NULL
GROUP BY Customer_ID
ORDER BY Total_Orders DESC;

-- Count total completely null rows remaining for targeted cleanup
SELECT COUNT(*) 
FROM restaurant_sales_data
WHERE Price IS NULL
  AND Quantity IS NULL
  AND Order_Total IS NULL
  AND Item IS NULL;

-- Remove remaining records with completely blank transaction attributes
DELETE FROM restaurant_sales_data
WHERE Price IS NULL
  AND Quantity IS NULL
  AND Order_Total IS NULL
  AND Item IS NULL;

-- Identify rows where only the Price is missing, but Quantity and Order_Total are available
SELECT * 
FROM restaurant_sales_data
WHERE Price IS NULL
  AND Quantity IS NOT NULL
  AND Order_Total IS NOT NULL;

-- Impute missing prices by dividing Order_Total by Quantity, safely avoiding division by zero
UPDATE restaurant_sales_data
SET Price = (Order_Total / Quantity)
WHERE Price IS NULL
  AND Quantity IS NOT NULL
  AND Order_Total IS NOT NULL
  AND Quantity <> 0;

-- ==========================================
-- 5. STATISTICAL CHECKS & LOGICAL IMPUTATION
-- ==========================================

-- Calculate basic financial summary statistics for order totals
SELECT MAX(Order_Total) AS Highest_Bill_Cost,
       MIN(Order_Total) AS Lowest_Bill_Cost,
       ROUND(AVG(Order_Total), 2) AS Avg_Bill_Cost
FROM restaurant_sales_data;

-- Investigate orders with the minimum bill cost of 1 to identify anomalies or specific items
SELECT Order_ID,
       Category,
       Item,
       Price,
       Quantity,
       Order_Total
FROM restaurant_sales_data
WHERE Order_Total = 1;

-- Check items associated specifically with a price equal to 1
SELECT Category,
       Item
FROM restaurant_sales_data
WHERE Price = 1;

-- Logically impute missing item names as 'Water' where price, quantity, and category uniquely match bottled water
UPDATE restaurant_sales_data
SET Item = 'Water'
WHERE Item IS NULL
  AND Price = 1
  AND Quantity = 1
  AND Category = 'Drinks';

-- ==========================================
-- 6. OPERATIONAL & SYSTEM HEALTH CHECK
-- ==========================================

-- Analyze the distribution of missing payment methods over order dates to detect potential system or UI downtime
SELECT Order_Date,
       COUNT(*) AS Count_Nulls
FROM restaurant_sales_data
WHERE Payment_Method IS NULL
GROUP BY Order_Date
ORDER BY Count_Nulls DESC;