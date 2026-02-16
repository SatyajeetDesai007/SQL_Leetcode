WITH Num_Seq AS (
    SELECT 
        num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_1,
        LEAD(num, 2) OVER (ORDER BY id) AS next_2
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM Num_Seq
WHERE num = next_1 AND num = next_2;

-- We use LEAD to give each row a "Team of 3" (Itself + Next 2 neighbors).
-- The WHERE clause checks if all 3 teammates are identical.
-- We use DISTINCT because a long streak (like five 1s) would trigger 
-- the match multiple times, and we only need to report the number '1' once.