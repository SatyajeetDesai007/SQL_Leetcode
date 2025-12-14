SELECT 
    u.name, 
    SUM(t.amount) AS balance FROM Users AS u
LEFT JOIN 
    Transactions AS t
ON 
    u.account = t.account
GROUP BY
     u.account,u.name
HAVING 
    SUM(t.amount) > 10000;

--Execution of SQL Query = WHERE -> GROUP BY -> SUM / COUNT -> HAVING -> SELECT