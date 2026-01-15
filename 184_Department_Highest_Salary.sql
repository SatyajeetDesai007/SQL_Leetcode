WITH rank AS (
    SELECT 
        d.name AS Department,
        e.name AS Employee ,
        e. salary AS salary,
        dense_rank()OVER(PARTITION BY  e.departmentId ORDER BY  e.salary DESC) AS rank_no
    FROM 
        Employee e
    LEFT JOIN 
        Department d
    ON 
        e.departmentId = d.id 
)
SELECT 
    Department,
    Employee,
    salary
FROM 
    rank
WHERE 
    rank_no = 1;

--Unlike COUNT(id) or SUM(salary), ranking functions like DENSE_RANK(), RANK(), and ROW_NUMBER() never take an argument inside the parentheses. The sorting logic lives entirely inside the OVER() clause.

--The PARTITION BY is for defining the groups (the buckets), while the ORDER BY is for the sorting inside the bucket.