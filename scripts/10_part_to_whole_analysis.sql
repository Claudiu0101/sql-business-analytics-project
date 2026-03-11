/*
----- Part-to-Whole Analysis -----

Script Purpose:
    - Determine which product categories contribute most to total sales
    - Calculate each category's percentage of overall sales
*/

-- Compute total sales per category and their share of overall sales
WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    -- Total sales across all categories
    SUM(total_sales) OVER () AS overall_sales,
    -- Percentage contribution of each category
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;