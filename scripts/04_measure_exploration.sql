/*
----- Measure Exploration -----

Script Purpose:
    - Analyze key business metrics from fact and dimension tables
    - Calculate total sales, quantity, orders, products, and customers
*/

-- 1. Find the total sales amount
SELECT 
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- 2. Find the total quantity of items sold
SELECT 
    SUM(quantity) AS total_quantity
FROM gold.fact_sales;

-- 3. Find the average selling price per item
SELECT 
    AVG(price) AS avg_price
FROM gold.fact_sales;

-- 4. Find the total number of orders
SELECT 
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

-- 5. Find the total number of products
SELECT 
    COUNT(DISTINCT product_key) AS total_products
FROM gold.dim_products;

-- 6. Find the total number of customers
SELECT 
    COUNT(customer_key) AS total_customers
FROM gold.dim_customers;

-- 7. Find the total number of customers who placed an order
SELECT 
    COUNT(DISTINCT customer_key) AS total_customers_with_orders
FROM gold.fact_sales;

-- 8. Report that consolidates all key metrics of the business
SELECT 
    'Total Sales' AS measure_name, 
    SUM(sales_amount) AS measure_value 
FROM gold.fact_sales
UNION ALL
SELECT 
    'Total Quantity', 
    SUM(quantity) 
FROM gold.fact_sales
UNION ALL
SELECT 
    'Average Price', 
    AVG(price) 
FROM gold.fact_sales
UNION ALL
SELECT 
    'Total Orders', 
    COUNT(DISTINCT order_number) 
FROM gold.fact_sales
UNION ALL
SELECT 
    'Total Products', 
    COUNT(DISTINCT product_key) 
FROM gold.dim_products
UNION ALL
SELECT 
    'Total Customers', 
    COUNT(customer_key) 
FROM gold.dim_customers;