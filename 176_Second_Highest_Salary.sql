SELECT (
    WITH highestsalary AS (
    SELECT e.salary ,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank 
    FROM Employee e
)
SELECT DISTINCT Salary
FROM highestsalary 
WHERE salary_rank = 2 
) AS SecondHighestSalary;


--Execution Flow : 
-- 1) WITH (Common Table Expression): Acts as a temporary workspace to organize the ranking before the main selection happens.
-- 2) DENSE_RANK(): Assigned a rank to each salary. It handles ties by giving the same rank to identical salaries (e.g., two people with the top salary are both #1) and doesn't skip the next number.
-- 3) OVER (ORDER BY salary DESC): Tells the rank function to look at the whole table and sort by the highest money first.
-- 4) WHERE salary_rank = 2: Filters the ranked list to find exactly the second position.
-- 5) SELECT ( ... ) (The Wrapper): This is the "Safety Net." It converts an empty search result into a NULL value to meet the problem's requirements.