use task6;

-- 1. Total Revenue by Month

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(list_price) AS total_revenue
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year, order_month;


-- 2. Monthly Order Volume (Distinct Orders)

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year, order_month;


-- 3. Top 5 Products by Revenue

SELECT
    product_id,
    SUM(list_price) AS total_sales
FROM
    orders
GROUP BY
    product_id
ORDER BY
    total_sales DESC
LIMIT 5;


-- 4. Top 5 Cities by Number of Orders

SELECT
    city,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    orders
GROUP BY
    city
ORDER BY
    total_orders DESC
LIMIT 5;


-- 5. Average Discount by Category

SELECT
    category,
    AVG(discount_percent) AS avg_discount
FROM
    orders
GROUP BY
    category
ORDER BY
    avg_discount DESC;


-- 6. Monthly Profit Trend

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM((list_price - cost_price) * quantity * (1 - discount_percent)) AS total_profit
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year, order_month;