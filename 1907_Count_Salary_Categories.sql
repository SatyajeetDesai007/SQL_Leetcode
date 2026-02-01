WITH CategorizedAccounts AS (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END AS category
    FROM Accounts
),
CategoryList AS (
    SELECT 'Low Salary' AS category
    UNION SELECT 'Average Salary'
    UNION SELECT 'High Salary'
)

SELECT 
    l.category, 
    COUNT(c.category) AS accounts_count
FROM CategoryList l
LEFT JOIN CategorizedAccounts c ON l.category = c.category
GROUP BY l.category;