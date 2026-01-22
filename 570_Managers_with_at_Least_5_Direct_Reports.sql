WITH Manager_count AS(
    SELECT 
        managerId,
        COUNT('id') AS total_reports
    FROM 
        Employee 
    WHERE 
        managerId IS NOT NULL
    GROUP BY 
        managerId 
    HAVING 
        COUNT(id)>=5

)
SELECT 
    e.name  
FROM 
    Employee e
INNER JOIN 
    manager_count m
ON 
e.id = m.managerId;
