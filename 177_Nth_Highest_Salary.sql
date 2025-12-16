CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    WITH SalariesRank AS (
        SELECT 
            e.salary, DENSE_RANK() OVER (ORDER BY e.salary DESC) AS rank_num
            FROM Employee AS e
    )
    SELECT 
        SR.salary 
    FROM
        SalariesRank AS SR
    WHERE 
        SR.rank_num = N
    GROUP BY SR.salary
    LIMIT 1
      
  );
END;
$$ LANGUAGE plpgsql;


--DENSE_RANK() is used to correctly handle duplicate salaries (ties), ensuring that all  identical salaries receive the same rank and that the next distinct salary receives the next sequential rank (e.g., Rank 1, 1, 2, 3).

--It assigns a unique, continuous rank number to the salaries after they are ordered (Highest salary gets Rank 1, second-highest gets Rank 2, and so on), thanks to the ORDER BY salary DESC within the OVER() clause.