SELECT 
    Activity_date AS day,
    COUNT(distinct user_id) AS active_users
FROM
    Activity
WHERE
    activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
GROUP by 
    activity_date;