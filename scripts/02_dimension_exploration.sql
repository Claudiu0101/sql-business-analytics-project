/*
----- Dimension Exploration -----

Script Purpose:
    - Explore the structure and key attributes of dimension tables

SQL Functions Used:
    - DISTINCT
    - ORDER BY
*/

-- Identify all countries where customers are located
SELECT DISTINCT country
FROM gold.dim_customers;


-- Explore product hierarchy: category, subcategory, and product names
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;