WITH cte AS (
    SELECT 
        a1.machine_id ,
        a1.process_id ,
        a1.timestamp  AS starting,
        a2.timestamp AS ending
    FROM
        Activity a1 
    JOIN 
        Activity A2
    ON 
        a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id 
    WHERE 
        a1.activity_type = 'start' AND a2.activity_type = 'end'
)
SELECT 
    machine_id ,
    ROUND(AVG(ending-starting)::NUMERIC, 3) AS processing_time 
FROM 
    cte 
GROUP BY 
    machine_id ;


--I used a Self-Join inside a CTE because the data was 'vertical' (start and end on different rows). By mirroring the table, I forced the starting and ending times to sit on the same row. Once they were side-by-side, the math was just simple subtraction before averaging it out.



















