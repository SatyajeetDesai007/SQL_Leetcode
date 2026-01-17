WITH currentEmployee AS(
    SELECT 
        employee_id
    FROM 
        Employees 
)
SELECT 
    e.employee_id
FROM 
    Employees e
WHERE 
    e.salary < 30000 AND
    e.manager_id NOT IN (SELECT employee_id FROM currentEmployee);


-- step 1 :(CTE) that selects all employee_ids from the original Employees.

-- step 2 :(subquery) The main query filters the raw table for salary < 30000 and checks if the manager_id is missing from the FullRegistry