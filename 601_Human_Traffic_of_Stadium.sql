WITH PeopleCount AS (
    SELECT 
        *,
          -- We 'reach' into the past and future to see if our neighbors are also       high-traffic.If any of these are < 100, the 'chain' breaks at that point.
        LAG(people, 1) OVER (ORDER BY id) AS p1,
        LAG(people, 2) OVER (ORDER BY id) AS p2,
        LEAD(people, 1) OVER (ORDER BY id) AS n1,
        LEAD(people, 2) OVER (ORDER BY id) AS n2
    FROM 
        Stadium
)
SELECT id, visit_date, people
FROM PeopleCount
WHERE people >= 100 AND (
    (n1 >= 100 AND n2 >= 100)  
    OR 
    (p1 >= 100 AND n1 >= 100)  
    OR 
    (p1 >= 100 AND p2 >= 100)  
)
ORDER BY visit_date;