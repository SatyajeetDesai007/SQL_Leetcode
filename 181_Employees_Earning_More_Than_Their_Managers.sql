SELECT
     e1.name as Employee
FROM 
    Employee e1
LEFT JOIN 
    Employee e2
ON
     e1.managerId = e2.id
WHERE
     e1.salary > e2.salary;

-- in one table there has 2 id's we need to join that table using JOINS and filter similar id employees.