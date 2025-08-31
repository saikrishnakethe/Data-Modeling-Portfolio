-- Aggregation Query: Total Stock Quantity per Category
SELECT c.category_name,
       SUM(f.stock_qty) AS total_stock
FROM inventory_fact f
JOIN products p ON f.product_id = p.product_id
JOIN subcategories s ON p.subcategory_id = s.subcategory_id
JOIN categories c ON s.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_stock DESC;

-- Filter Query: Products Below Reorder Level
SELECT p.product_name,
       f.stock_qty,
       f.reorder_level
FROM inventory_fact f
JOIN products p ON f.product_id = p.product_id
WHERE f.stock_qty < f.reorder_level
ORDER BY f.stock_qty ASC;

-- Join + Analytical Query: Average Selling Price per Brand
SELECT p.brand,
       AVG(f.selling_price) AS avg_selling_price
FROM inventory_fact f
JOIN products p ON f.product_id = p.product_id
GROUP BY p.brand
ORDER BY avg_selling_price DESC;

-- Supplier-wise Inventory Value Query
SELECT s.supplier_name,
       SUM(f.stock_qty * f.cost_price) AS total_inventory_value
FROM inventory_fact f
JOIN suppliers s ON f.supplier_id = s.supplier_id
GROUP BY s.supplier_name
ORDER BY total_inventory_value DESC;
