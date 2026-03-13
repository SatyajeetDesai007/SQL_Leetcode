-- in this example we 1st group individual employee ids and then count it and maintain that count in one column using window function and create CTE of that.
-- after CTE is completed we filter the as per our requirement for that we use OR operator with where condition .
-- business requirement is if employee has single count, or if they are multitasker then primary flag column they mention 'Y' Infront of there department_id.

WITH CountEmployee AS(
    SELECT
        employee_id,
        department_id,
        primary_flag ,
        COUNT('employee_id') OVER(PARTITION BY employee_id) AS CountEmp
    FROM Employee
)
SELECT
    c.employee_id,
    c.department_id 
FROM 
    CountEmployee c
WHERE 
    c.CountEmp = 1 OR c.primary_flag ='Y';