-- Looks at how products are performing, to identify
-- best sellers, top earners, and possible underperformers.

-- Q1: Which 10 products sell the highest quantity?
SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM pub_sales
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Q2: Which 10 products generate the most revenue?
SELECT
    product_name,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM pub_sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Q3: Which 10 products generate the most profit?
SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM pub_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Q4: Which products sell the lowest quantity? (possible candidates to review or drop)
SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM pub_sales
GROUP BY product_name
ORDER BY total_quantity_sold ASC
LIMIT 10;

-- Q5: What is the average sale price and profit margin for each product?
SELECT
    product_name,
    ROUND(AVG(sale_price), 2) AS avg_sale_price,
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM pub_sales
GROUP BY product_name
ORDER BY profit_margin_pct DESC;

-- Q6: How many times has each product appeared in an order (line item count)?
SELECT
    product_name,
    COUNT(*) AS times_sold
FROM pub_sales
GROUP BY product_name
ORDER BY times_sold DESC
LIMIT 10;
