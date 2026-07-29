-- Creates the pub_sales table used throughout this project.
-- This is a reference copy of the schema created by
-- scripts/load_data.py, kept here so the table structure can be
-- read or rebuilt directly in SQL.

DROP TABLE IF EXISTS pub_sales;

CREATE TABLE pub_sales (
    transaction_id TEXT,      -- unique ID shared by all items in one order
    date           TEXT,      -- stored as 'YYYY-MM-DD'
    time           TEXT,      -- stored as 'HH:MM' (24-hour clock)
    product_name   TEXT,      -- name of the item sold, e.g. 'Coke'
    category       TEXT,      -- product category, e.g. 'Beer', 'Spirits'
    quantity       INTEGER,   -- number of units sold in this line item
    sale_price     REAL,      -- price per unit charged to the customer
    cost_price     REAL,      -- cost per unit to the pub
    staff_member   TEXT,      -- staff member who served the sale
    revenue        REAL,      -- quantity * sale_price
    cost           REAL,      -- quantity * cost_price
    profit         REAL       -- revenue - cost
);
