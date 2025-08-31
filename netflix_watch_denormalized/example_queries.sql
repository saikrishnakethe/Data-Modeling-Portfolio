-- Aggregation Query: Total Watch Duration per Content Type
SELECT content_type,
       SUM(duration_min) AS total_watch_duration
FROM watch_fact
GROUP BY content_type
ORDER BY total_watch_duration DESC;

-- Top Users by Total Watch Duration
SELECT user_id,
       SUM(duration_min) AS total_watch_duration
FROM watch_fact
GROUP BY user_id
ORDER BY total_watch_duration DESC
LIMIT 10;

-- Binge Watching Count per Subscription Plan
SELECT subscription_plan,
       COUNT(*) AS binge_sessions
FROM watch_fact
WHERE binge_flag = TRUE
GROUP BY subscription_plan
ORDER BY binge_sessions DESC;

-- Average Completion Rate per Genre
SELECT content_genre,
       AVG(CASE WHEN completed_flag = TRUE THEN 1 ELSE 0 END) AS avg_completion_rate
FROM watch_fact
GROUP BY content_genre
ORDER BY avg_completion_rate DESC;
