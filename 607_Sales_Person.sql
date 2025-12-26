SELECT DISTINCT NAME
FROM (
    SELECT s.name,
    SUM(CASE WHEN c.name = 'RED' THEN 1 ELSE 0 END)OVER(PARTITION BY s.sales_id) AS c_count
    FROM SalesPerson s 
    LEFT JOIN Orders o ON s.sales_id = o.sales_id
    LEFT JOIN Company c ON o.com_id = c.com_id
) AS active
WHERE 
c_count = 0 OR c_count IS NULL;

-- SUM function used :
--For each person, look through all their orders. If you see 'RED', count 1. Then, write that total 'Red Flag' count next to every single row for that person.
