-- Query 1: Total Revenue per Driver (including tips and surge)
SELECT d.driver_id, d.first_name, d.last_name,
       SUM(f.total_amount) AS total_revenue,
       COUNT(f.trip_id) AS total_trips
FROM trips_fact f
JOIN drivers d ON f.driver_id = d.driver_id
WHERE d.active_flag = TRUE
GROUP BY d.driver_id, d.first_name, d.last_name
ORDER BY total_revenue DESC;

-- Query 2: Top 5 Riders by Trip Count in Last 6 Months
SELECT r.rider_id, r.first_name, r.last_name,
       COUNT(f.trip_id) AS trip_count
FROM trips_fact f
JOIN riders r ON f.rider_id = r.rider_id
WHERE f.trip_start_ts >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
GROUP BY r.rider_id, r.first_name, r.last_name
ORDER BY trip_count DESC
LIMIT 5;

-- Query 3: Average Trip Distance by Vehicle Make & Model
SELECT v.make, v.model,
       AVG(f.trip_distance_km) AS avg_distance,
       AVG(f.trip_duration_min) AS avg_duration
FROM trips_fact f
JOIN vehicles v ON f.vehicle_id = v.vehicle_id
GROUP BY v.make, v.model
ORDER BY avg_distance DESC;

-- Query 4: Cancelled Trip Percentage by Trip Status
SELECT ts.status_name,
       COUNT(f.trip_id) AS total_trips,
       ROUND(100.0 * SUM(CASE WHEN ts.status_name = 'CANCELLED' THEN 1 ELSE 0 END)/COUNT(f.trip_id), 2) AS cancelled_percentage
FROM trips_fact f
JOIN trip_status ts ON f.trip_status_id = ts.trip_status_id
GROUP BY ts.status_name
ORDER BY cancelled_percentage DESC;
