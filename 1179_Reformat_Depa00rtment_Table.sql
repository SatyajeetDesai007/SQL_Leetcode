SELECT 
    id, 
    SUM(CASE WHEN month='Jan' THEN revenue ELSE NULL END ) AS Jan_Revenue,
    SUM(CASE WHEN month='Feb' THEN revenue ELSE NULL END ) AS Feb_Revenue,
    SUM(CASE WHEN month='Mar' THEN revenue ELSE NULL END ) AS Mar_Revenue,
    SUM(CASE WHEN month='Apr' THEN revenue ELSE NULL END ) AS Apr_Revenue,
    SUM(CASE WHEN month='May' THEN revenue ELSE NULL END ) AS May_Revenue,
    SUM(CASE WHEN month='Jun' THEN revenue ELSE NULL END ) AS Jun_Revenue,
    SUM(CASE WHEN month='Jul' THEN revenue ELSE NULL END ) AS Jul_Revenue,
    SUM(CASE WHEN month='Aug' THEN revenue ELSE NULL END ) AS Aug_Revenue,
    SUM(CASE WHEN month='Sep' THEN revenue ELSE NULL END ) AS Sep_Revenue,
    SUM(CASE WHEN month='Oct' THEN revenue ELSE NULL END ) AS Oct_Revenue,
    SUM(CASE WHEN month='Nov' THEN revenue ELSE NULL END ) AS Nov_Revenue,
    SUM(CASE WHEN month='Dec' THEN revenue ELSE NULL END ) AS Dec_Revenue
FROM 
    Department
GROUP BY 
    id;

--We use SUM(CASE WHEN...) to create "buckets" for each month.
--"Single-Scan" Win(CASE): Instead of joining the table to itself 12 times (which would be a performance nightmare), this approach reads the data exactly once 
--By using GROUP BY id, we collapse multiple monthly records into a single.