-- Total Sales per Product Category (with Promotions)
SELECT p.category, pr.promotion_name, SUM(f.total_amount) as total_sales
FROM sales_fact f
JOIN products p ON f.product_id = p.product_id
LEFT JOIN promotions pr ON f.promotion_id = pr.promotion_id
GROUP BY p.category, pr.promotion_name;

-- Top 5 Customers by Revenue in Q1
SELECT c.first_name, c.last_name, SUM(f.total_amount) as revenue
FROM sales_fact f
JOIN customers c ON f.customer_id = c.customer_id
JOIN dates d ON f.date_id = d.date_id
WHERE d.quarter = 1
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY revenue DESC
LIMIT 5;

-- Store-wise Monthly Sales
SELECT s.store_name, d.year, d.month, SUM(f.total_amount) as monthly_sales
FROM sales_fact f
JOIN stores s ON f.store_id = s.store_id
JOIN dates d ON f.date_id = d.date_id
GROUP BY s.store_name, d.year, d.month
ORDER BY d.year, d.month;
