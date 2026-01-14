#Create Database & Table
CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),
    profit_margin DECIMAL(6,4)
);

#Total Sales & Total Profit
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore;

#Sales & Profit by Region
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region;

#Profit by Category
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category;

#Profit by Sub-Category
SELECT 
    `Sub_Category`,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Sub_Category`
ORDER BY Total_Profit ASC;

#Top 10 Loss-Making Products
SELECT 
    `Product_Name`,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Product_Name`
ORDER BY Total_Profit ASC
LIMIT 10;

#Monthly Sales Trend
SELECT 
    YEAR(`Order_Date`) AS Year,
    MONTH(`Order_Date`) AS Month,
    SUM(Sales) AS Monthly_Sales,
    SUM(Profit) AS Monthly_Profit
FROM superstore
GROUP BY Year, Month
ORDER BY Year, Month;

#Discount Impact on Profit
SELECT 
    Discount,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

#Profit Margin Analysis
SELECT 
    Category,
    AVG(`Profit_Margin`) AS Avg_Profit_Margin
FROM superstore
GROUP BY Category;













