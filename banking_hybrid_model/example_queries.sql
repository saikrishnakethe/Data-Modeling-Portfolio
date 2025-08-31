-- Total transaction amount per account (basic aggregation)
SELECT 
    account_id, 
    SUM(amount) AS total_transaction_amount
FROM transactions_fact
GROUP BY account_id
ORDER BY total_transaction_amount DESC;

-- Customer details with their account and branch (normalized join)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    b.branch_name,
    b.city
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN branches b ON a.branch_id = b.branch_id;

-- Branch-level monthly transaction volume (time-based aggregation)
SELECT 
    b.branch_name,
    DATE_TRUNC('month', t.transaction_date) AS month,
    COUNT(t.transaction_id) AS transaction_count,
    SUM(t.amount) AS total_amount
FROM transactions_fact t
JOIN accounts a ON t.account_id = a.account_id
JOIN branches b ON a.branch_id = b.branch_id
GROUP BY b.branch_name, DATE_TRUNC('month', t.transaction_date)
ORDER BY b.branch_name, month;

-- Top 5 employees by total transaction value handled (analytics query)
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(t.amount) AS total_handled
FROM employees e
JOIN branches b ON e.branch_id = b.branch_id
JOIN accounts a ON b.branch_id = a.branch_id
JOIN transactions_fact t ON a.account_id = t.account_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_handled DESC
LIMIT 5;
