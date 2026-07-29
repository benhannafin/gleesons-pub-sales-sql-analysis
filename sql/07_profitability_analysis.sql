-- Focuses specifically on profit margins, to see where the pub
-- makes the most money relative to what it sells.

-- Q1: What is the profit margin for every product, from highest to lowest?
SELECT
    product_name,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM pub_sales
GROUP BY product_name
ORDER BY profit_margin_pct DESC;

-- Q2: Which 5 products have the highest profit margins?
SELECT
    product_name,
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM pub_sales
GROUP BY product_name
ORDER BY profit_margin_pct DESC
LIMIT 5;

-- Q3: Which 5 products have the lowest profit margins?
SELECT
    product_name,
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM pub_sales
GROUP BY product_name
ORDER BY profit_margin_pct ASC
LIMIT 5;

-- Q4: Which category contributes the largest share of total profit?
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) * 100.0 / (SELECT SUM(profit) FROM pub_sales), 2) AS pct_of_total_profit
FROM pub_sales
GROUP BY category
ORDER BY total_profit DESC;

-- Q5: Are there any products being sold at a loss overall?
SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM pub_sales
GROUP BY product_name
HAVING total_profit < 0
ORDER BY total_profit ASC;

-- Q6: Which products have a profit margin below the pub's overall average margin?
SELECT
    product_name,
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM pub_sales
GROUP BY product_name
HAVING profit_margin_pct < (
    SELECT ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) FROM pub_sales
)
ORDER BY profit_margin_pct ASC;
