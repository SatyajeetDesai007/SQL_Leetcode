WITH employeeRank AS(
    SELECT
        e.name AS Employee,
        d.name AS Department,
        e.salary AS Salary,
        DENSE_RANK()OVER(PARTITION BY  e.departmentId ORDER BY e.salary DESC ) as Emprank
    FROM 
        Employee e 
    JOIN 
        Department d
    ON 
        e.departmentId = d.id   
)
SELECT 
    Department,
    Employee,
    Salary
FROM 
    employeeRank
WHERE 
    Emprank < 4;

-- DENSE_RANK() specifically because the business requirement is for the Top 3 unique salaries
-- If three people all earn the highest salary of 100k, ROW_NUMBER would label them 1, 2, and 3. But DENSE_RANK labels them all as 1.