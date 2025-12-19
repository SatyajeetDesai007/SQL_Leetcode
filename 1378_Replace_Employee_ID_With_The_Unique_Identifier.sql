SELECT 
    eu.unique_id ,
     e.name
FROM
     EmployeeUNI eu
RIGHT JOIN 
    Employees e
ON 
    e.id = eu.id

--RIGHT JOIN ensures every employee from the Employees table is included in the final result, even if they lack a matching entry in EmployeeUNI