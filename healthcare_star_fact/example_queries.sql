-- Total Revenue per Doctor including historical SCD Type 2 tracking
SELECT d.first_name, d.last_name, SUM(f.total_fee) AS total_revenue
FROM visit_fact f
JOIN doctors d ON f.doctor_sk = d.doctor_sk
WHERE d.current_flag = TRUE
GROUP BY d.first_name, d.last_name
ORDER BY total_revenue DESC;

-- Patient Visit History with historical dimension tracking
SELECT p.first_name, p.last_name, v.visit_start_ts, v.visit_end_ts, v.total_fee
FROM visit_fact v
JOIN patients p ON v.patient_sk = p.patient_sk
ORDER BY p.last_name, v.visit_start_ts DESC;

-- Top 5 Most Common Diagnoses
SELECT d.description, COUNT(f.visit_id) AS total_visits
FROM visit_fact f
JOIN diagnosis_codes d ON f.diagnosis_code_id = d.diagnosis_code_id
GROUP BY d.description
ORDER BY total_visits DESC
LIMIT 5;

-- Average Total Fee per Treatment Category
SELECT t.category, AVG(f.total_fee) AS avg_fee
FROM visit_fact f
JOIN treatments t ON f.treatment_id = t.treatment_id
GROUP BY t.category
ORDER BY avg_fee DESC;
