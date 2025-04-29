# Task_6
## Sales Trend Analysis Using SQL Aggregations
A collection of SQL scripts for analyzing e-commerce sales data through time-based aggregations and business metrics.

## 📚 Features
Monthly Revenue Analysis: Track sales performance over time
Order Volume Trends: Identify busy periods and seasonal patterns
Product/City Rankings: Discover top-performing products and regions
Discount Effectiveness: Analyze promotional strategies
Profit Monitoring: Track operational efficiency
## 🛠️ Setup Instructions
## Database Requirements

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    list_price DECIMAL(10,2),
    product_id INT,
    city VARCHAR(50),
    category VARCHAR(50),
    discount_percent DECIMAL(5,2),
    profit DECIMAL(10,2)
);

Import Data
Create database: CREATE DATABASE online_sales;
Import CSV: Use your DBMS's import tool (e.g., \copy in PostgreSQL)

## 📊 Key Queries
Monthly Sales Report

-- Revenue by Month
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(list_price) AS revenue,
  COUNT(DISTINCT order_id) AS orders
FROM orders
GROUP BY year, month
ORDER BY year, month;

##Product Performance

-- Top 5 Products
SELECT
  product_id,
  SUM(list_price) AS total_sales,
  AVG(profit) AS avg_profit
FROM orders
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;

## 📈 Results Visualization
Sample output format for monthly trends:

Year	Month	Revenue	Orders
2023	1	15000.00	120
2023	2	16500.00	135
## 🔍 Filtering Options
Add temporal filters to any query:

WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
