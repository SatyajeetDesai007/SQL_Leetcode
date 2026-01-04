SELECT DISTINCT
    TO_CHAR(trans_date,'YYYY-MM') AS month,
    country ,
    -- total count of transaction of "window" (Month + Country)
    COUNT(*)OVER(PARTITION BY TO_CHAR(trans_date,'YYYY-MM'),country) AS trans_count,
    -- Count only approved in this window
    COUNT(CASE WHEN state = 'approved' THEN 1 END ) 
        OVER(PARTITION BY TO_CHAR(trans_date,'YYYY-MM'),country) AS approved_count,
    -- Total amount in this window
    SUM(amount)
        OVER(PARTITION BY TO_CHAR(trans_date,'YYYY-MM'),country) AS trans_total_amount, 
    -- Total approved amount in this window
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END)
        OVER(PARTITION BY TO_CHAR(trans_date,'YYYY-MM'),country) AS approved_total_amount
FROM Transactions;


--- Calculates monthly aggregates without collapsing rows by using OVER(PARTITION BY...). It applies conditional logic (CASE WHEN) inside the window to isolate 'approved' metrics. Finally, DISTINCT is used to remove redundant rows, effectively simulating a GROUP BY while keeping the door open for row-level comparisons if needed."


