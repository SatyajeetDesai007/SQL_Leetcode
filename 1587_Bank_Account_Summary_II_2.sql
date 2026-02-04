WITH AggregatedData AS (
    SELECT 
        account, 
        SUM(amount) AS balance
    FROM Transactions
    GROUP BY account
    HAVING SUM(amount) > 10000
)
SELECT 
    u.name, 
    ad.balance
FROM
    AggregatedData as ad
JOIN 
    Users u 
ON 
    ad.account = u.account;
