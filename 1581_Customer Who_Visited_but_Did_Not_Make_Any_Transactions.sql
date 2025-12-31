WITH NoTransactions AS (
    SELECT 
        v.customer_id, 
        v.visit_id
    FROM Visits v
    LEFT JOIN Transactions t ON v.visit_id = t.visit_id
    WHERE t.transaction_id IS NULL 
)
SELECT 
    customer_id, 
    COUNT(visit_id) AS count_no_trans
FROM NoTransactions
GROUP BY customer_id;


--I went with a CTE here to keep things clean. It breaks the logic into two clear steps: first, it uses a LEFT JOIN to find the 'missing' transactions (where the ID is NULL), then it just counts those leftovers. It’s way easier to read and debug than a messy nested subquery.