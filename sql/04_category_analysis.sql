-- Compares performance across product categories

-- Q1: What total revenue and profit does each category generate?
SELECT
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM pub_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Q2: How many items has each category sold in total?
SELECT
    category,
    SUM(quantity) AS total_quantity_sold
FROM pub_sales
GROUP BY category
ORDER BY total_quantity_sold DESC;

-- Q3: What is the average sale price within each category?
SELECT
    category,
    ROUND(AVG(sale_price), 2) AS avg_sale_price
FROM pub_sales
GROUP BY category
ORDER BY avg_sale_price DESC;

-- Q4: What is the profit margin achieved by each category?
SELECT
    category,
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM pub_sales
GROUP BY category
ORDER BY profit_margin_pct DESC;

-- Q5: What percentage of total revenue does each category contribute?
SELECT
    category,
    ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM pub_sales), 2) AS pct_of_total_revenue
FROM pub_sales
GROUP BY category
ORDER BY pct_of_total_revenue DESC;

-- Q6: How many different products are sold within each category?
SELECT
    category,
    COUNT(DISTINCT product_name) AS product_count
FROM pub_sales
GROUP BY category
ORDER BY product_count DESC;
