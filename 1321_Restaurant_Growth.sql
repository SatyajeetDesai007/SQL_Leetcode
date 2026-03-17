WITH dailysum AS(
    SELECT 
        visited_on,
        SUM(amount) as day_sum
    FROM 
        Customer
    GROUP BY 
        visited_on
), Win_Slide AS(
    SELECT 
        visited_on,
        SUM(day_sum)OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS total_sum,
        ROUND(AVG(day_sum)OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount,
        ROW_NUMBER()OVER(ORDER BY visited_on) AS day_num 
    FROM 
        dailysum
)
SELECT 
    visited_on,
    total_sum as amount,
    average_amount
FROM
    Win_Slide
WHERE 
    day_num >= 7;

-- ROWS BETWEEN 6 PRECEDING AND CURRENT ROW defines the width of your "lens" (7 days total)
-- ROW_NUMBER() to ignore the first few rows. A "7-day average" is a lie until you actually have 7 days of data to look at.