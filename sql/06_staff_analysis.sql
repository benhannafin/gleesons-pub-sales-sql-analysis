-- Looks at sales activity by staff member: how much each
-- person sells, how often they work, and how their sales
-- perform on average.

-- Q1: How much revenue and profit has each staff member generated?
SELECT
    staff_member,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM pub_sales
GROUP BY staff_member
ORDER BY total_revenue DESC;

-- Q2: How many transactions has each staff member handled?
SELECT
    staff_member,
    COUNT(DISTINCT transaction_id) AS total_transactions
FROM pub_sales
GROUP BY staff_member
ORDER BY total_transactions DESC;

-- Q3: What is the average transaction value handled by each staff member?
SELECT
    staff_member,
    ROUND(SUM(revenue) * 1.0 / COUNT(DISTINCT transaction_id), 2) AS avg_revenue_per_transaction
FROM pub_sales
GROUP BY staff_member
ORDER BY avg_revenue_per_transaction DESC;

-- Q4: On how many different days has each staff member made a sale?
SELECT
    staff_member,
    COUNT(DISTINCT date) AS days_worked
FROM pub_sales
GROUP BY staff_member
ORDER BY days_worked DESC;

-- Q5: Which staff member sells the most items in total?
SELECT
    staff_member,
    SUM(quantity) AS total_items_sold
FROM pub_sales
GROUP BY staff_member
ORDER BY total_items_sold DESC;

-- Q6: What profit margin does each staff member's sales achieve on average?
SELECT
    staff_member,
    ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM pub_sales
GROUP BY staff_member
ORDER BY profit_margin_pct DESC;
