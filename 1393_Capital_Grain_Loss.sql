SELECT 
    stock_name, 
    SUM (
        CASE 
            WHEN operation = 'Buy' THEN -price
            ELSE price
        END
    ) AS capital_gain_loss
FROM 
    Stocks
GROUP BY 
    stock_name;

--We use CASE WHEN inside an aggregate function (SUM) to process data in a single pass.
--This is superior to joining subqueries because it minimizes I/O overhead and eliminates the need for a Data Shuffle or Sort-Merge between datasets