/*
----- Cumulative Analysis -----

Script Purpose:
    - Calculate monthly total sales
    - Compute running totals and moving averages over time
*/

-- Calculate yearly total sales with running total and moving average of price
SELECT
    order_year,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_year) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_year) AS moving_average_price
FROM
(
    SELECT 
        DATETRUNC(year, order_date) AS order_year,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t;