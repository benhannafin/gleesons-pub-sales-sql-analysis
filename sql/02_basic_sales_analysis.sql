-- An overview of the pub's overall sales performance:
-- how much was sold, over what period, and how revenue trends
-- over time.

-- Q1: How many transactions are in the dataset, and over what date range?
SELECT
    COUNT(DISTINCT transaction_id) AS total_transactions,
    MIN(date) AS first_date,
    MAX(date) AS last_date
FROM pub_sales;

-- Q2: How many individual items were sold in total?
SELECT
    SUM(quantity) AS total_items_sold
FROM pub_sales;

-- Q3: What is the total revenue, total cost, and total profit for the whole period?
SELECT
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit
FROM pub_sales;

-- Q4: What is the overall profit margin?
SELECT
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS overall_profit_margin_pct
FROM pub_sales;

-- Q5: What is the average value of a single line item?
SELECT
    ROUND(AVG(revenue), 2) AS avg_line_item_revenue
FROM pub_sales;

-- Q6: What is the average revenue per whole transaction (all items in one order)?
SELECT
    ROUND(SUM(revenue) * 1.0 / COUNT(DISTINCT transaction_id), 2) AS avg_revenue_per_transaction
FROM pub_sales;

-- Q7: How do revenue and profit trend month by month across the year?
SELECT
    strftime('%Y-%m', date) AS sales_month,
    ROUND(SUM(revenue), 2) AS monthly_revenue,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM pub_sales
GROUP BY sales_month
ORDER BY sales_month;
