DELETE 
FROM person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM person 
    GROUP BY email
)
;

-- taking GROUP BY Clause to group all duplicate emails . and take small id using MIN() Function.


