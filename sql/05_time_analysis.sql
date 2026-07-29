-- Looks at when the pub is busiest. Which days
-- have the most trade, and which times are
-- peak trading hours.

-- Q1: What is total revenue for each day of the week?
-- SQLite's strftime('%w', date) returns 0 = Sunday, 1 = Monday, ... 6 = Saturday.
SELECT
    CASE strftime('%w', date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM pub_sales
GROUP BY strftime('%w', date)
ORDER BY strftime('%w', date);

-- Q2: Which day of the week has the highest number of transactions?
SELECT
    CASE strftime('%w', date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    COUNT(DISTINCT transaction_id) AS total_transactions
FROM pub_sales
GROUP BY strftime('%w', date)
ORDER BY total_transactions DESC;

-- Q3: How does revenue compare between weekdays and weekends?
SELECT
    CASE
        WHEN strftime('%w', date) IN ('0', '6') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM pub_sales
GROUP BY day_type;

-- Q4: What are the busiest trading hours of the day by revenue?
-- The time column is stored as 'HH:MM', so substr() pulls out just the hour.
SELECT
    substr(time, 1, 2) AS hour_of_day,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM pub_sales
GROUP BY hour_of_day
ORDER BY total_revenue DESC;

-- Q5: What are the quietest trading hours (fewest items sold)?
SELECT
    substr(time, 1, 2) AS hour_of_day,
    COUNT(*) AS items_sold
FROM pub_sales
GROUP BY hour_of_day
ORDER BY items_sold ASC
LIMIT 5;

-- Q6: How many distinct trading days are covered by the dataset?
SELECT
    COUNT(DISTINCT date) AS total_trading_days
FROM pub_sales;
