"""
A script that loads the pub sales CSV into a SQLite database.

What it does:
1. Reads data/pub_sales_data.csv
2. Renames the CSV's columns to clean, SQL-friendly snake_case names
3. Creates gleesons_pub_sales.db in the project root
4. Saves the cleaned data into a table called "pub_sales"
5. Prints how many rows were loaded
"""

import csv
import sqlite3
from pathlib import Path

# --- Paths -------------------------------------------------------------

# scripts/load_data.py -> project root is one folder up
PROJECT_ROOT = Path(__file__).resolve().parent.parent
CSV_PATH = PROJECT_ROOT / "data" / "pub_sales_data.csv"
DB_PATH = PROJECT_ROOT / "gleesons_pub_sales.db"

# --- Column renaming -----------------------------------------------------

# Maps the original CSV column names to snake_case names used in SQL.
COLUMN_RENAME_MAP = {
    "Transaction ID": "transaction_id",
    "Date": "date",
    "Time": "time",
    "Product Name": "product_name",
    "Category": "category",
    "Quantity": "quantity",
    "Sale Price": "sale_price",
    "Cost Price": "cost_price",
    "Staff Member": "staff_member",
    "Revenue": "revenue",
    "Cost": "cost",
    "Profit": "profit",
}

# The order of columns in the pub_sales table.
TABLE_COLUMNS = list(COLUMN_RENAME_MAP.values())


def create_table(connection):
    """Create the pub_sales table, replacing it if it already exists."""
    connection.execute("DROP TABLE IF EXISTS pub_sales")
    connection.execute(
        """
        CREATE TABLE pub_sales (
            transaction_id TEXT,
            date           TEXT,
            time           TEXT,
            product_name   TEXT,
            category       TEXT,
            quantity       INTEGER,
            sale_price     REAL,
            cost_price     REAL,
            staff_member   TEXT,
            revenue        REAL,
            cost           REAL,
            profit         REAL
        )
        """
    )


def load_csv_rows(csv_path):
    """Read the CSV and yield each row as a tuple in TABLE_COLUMNS order."""
    with open(csv_path, newline="", encoding="utf-8") as csv_file:
        reader = csv.DictReader(csv_file)

        for row in reader:
            # Rename keys from the original CSV headers to snake_case.
            clean_row = {
                COLUMN_RENAME_MAP[original_name]: value
                for original_name, value in row.items()
            }

            yield (
                clean_row["transaction_id"],
                clean_row["date"],
                clean_row["time"],
                clean_row["product_name"],
                clean_row["category"],
                int(clean_row["quantity"]),
                float(clean_row["sale_price"]),
                float(clean_row["cost_price"]),
                clean_row["staff_member"],
                float(clean_row["revenue"]),
                float(clean_row["cost"]),
                float(clean_row["profit"]),
            )


def main():
    connection = sqlite3.connect(DB_PATH)

    try:
        create_table(connection)

        rows = list(load_csv_rows(CSV_PATH))

        placeholders = ", ".join("?" for _ in TABLE_COLUMNS)
        connection.executemany(
            f"INSERT INTO pub_sales ({', '.join(TABLE_COLUMNS)}) VALUES ({placeholders})",
            rows,
        )
        connection.commit()

        print(f"Loaded {len(rows)} rows into '{DB_PATH.name}' (table: pub_sales)")
    finally:
        connection.close()


if __name__ == "__main__":
    main()
