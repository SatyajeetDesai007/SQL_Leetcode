SELECT DISTINCT
    event_day AS day,
    emp_id,
    SUM(out_time - in_time)OVER(PARTITION BY event_day , emp_id ) AS total_time
FROM 
    Employees;

--Standard Grouping collapses data into folders to get a final total. Window Functions (OVER) calculate the total 'behind the scenes' without shrinking the rows, which is why you need DISTINCT to clean up the duplicates at the end.

--Flow of Execution
--MATH: First, SQL calculates out_time - in_time for every single row in the table.
--WINDOW: The OVER(PARTITION BY...) looks at all rows sharing the same day and emp_id and adds their math together.
--ATTACH: It sticks that total onto every row in that group (so you see the same total multiple times).
--CLEAN: The DISTINCT command scans the final list and deletes the identical rows, leaving you with one clean total per person per day.