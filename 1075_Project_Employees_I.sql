SELECT
    p.project_id AS project_id ,
    ROUND(AVG(e.experience_years)::numeric, 2) average_years
FROM 
    Project p
LEFT JOIN
    Employee e
ON
    p.employee_id = e.employee_id
GROUP BY
    p.project_id;


-- AVG(...) : Adds up years and divides by the number of employees.
-- :: numeric : (PostgreSQL) Instantly changes the data type to allow for decimals.
-- ROUND(..., 2): Truncates the long decimal tail and rounds the second digit up or down based on the third digit.