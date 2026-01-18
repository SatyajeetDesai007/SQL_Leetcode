WITH weight_sum AS (
    SELECT 
        person_name,
        SUM(weight)OVER(ORDER BY  turn) AS total_sum 
    FROM 
        Queue    
)
SELECT
    person_name 
FROM 
    weight_sum
WHERE 
    total_sum <= 1000
ORDER BY 
    total_sum DESC
LIMIT 
    1;

--We avoided slow loops by using a Set-Based Window Function. This allows the database to calculate the "running total" for every row in a single, high-speed pass.

-- step 1 : Calculate the sum using SUM(weight) OVER (ORDER BY turn)
-- step 2: Since we are tracking one single bus, we didn't use PARTITION BY. Using only ORDER BY inside OVER() is creates a running total from the start of the table.
-- step 3 : We filtered for our limit (1000kg) and used ORDER BY DESC with LIMIT 1 to find the exact moment the bus was "full.