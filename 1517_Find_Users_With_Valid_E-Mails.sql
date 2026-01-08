WITH validation AS (
    SELECT  
        user_id,
        name,
        mail,                   
        CASE 
            WHEN mail ~ '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$' THEN 1
            ELSE 0
        END AS valid
    FROM 
        Users 
)
SELECT 
    user_id,
    name,
    mail
FROM 
    validation 
WHERE
    valid = 1;

--Use a CTE to create a temporary column (valid) that 'flags' rows with a 1 or 0 using Regex. This separates the complex logic (Regex) from the final output, making it easy to debug by simply toggling WHERE valid = 1 to WHERE valid = 0.