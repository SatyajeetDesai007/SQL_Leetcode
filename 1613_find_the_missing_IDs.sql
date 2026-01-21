WITH RECURSIVE scaffold AS (
	SELECT 1 AS n
	UNION ALL
	SELECT n + 1 
	FROM
	scaffold
	WHERE 
	n < 10
)
SELECT 
	s.n AS missing_ID
FROM 
	scaffold s
LEFT JOIN 
	Transactions t 
ON 
	s.n = t.transaction_id
WHERE 
	t.transaction_id IS NULL;

-- Recursive Loop : Generate a continuous sequence of data (numbers or dates) from scratch without using a physical table.	