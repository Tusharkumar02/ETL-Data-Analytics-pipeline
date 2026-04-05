-- =========================================
-- Database: Sales Analytics
-- Table: sales_data
-- =========================================

-- 1️⃣ Total Sales, Profit & Profit Percentage
SELECT 
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_percentage
FROM sales_data;


-- 2️⃣ Monthly Sales Growth
SELECT 
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales_data
GROUP BY month_number, month_name
ORDER BY month_number;


-- 3️⃣ Profit by Region
SELECT 
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_profit DESC;


-- 4️⃣ Sales by Product
SELECT 
    product,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales_data
GROUP BY product
ORDER BY total_sales DESC;


-- 5️⃣ Year-wise Sales (for Year Filter)
SELECT 
    YEAR(order_date) AS year,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales_data
GROUP BY year
ORDER BY year;


-- 6️⃣ Top 5 Products by Sales
SELECT 
    product,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales_data
GROUP BY product
ORDER BY total_sales DESC
LIMIT 5;