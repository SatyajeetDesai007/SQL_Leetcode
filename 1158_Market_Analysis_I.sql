WITH Sell2019 AS(
    SELECT DISTINCT
        buyer_id,
        COUNT(order_id) OVER (PARTITION BY buyer_id) AS count2019
    FROM 
        Orders
    WHERE
        order_date BETWEEN '2019-01-01' AND '2019-12-31'
)
 SELECT 
    u.user_id AS buyer_id ,
    u.join_date,
    COALESCE (s.count2019,0) AS orders_in_2019 
FROM 
    Users u
LEFT JOIN 
    Sell2019 s 
ON 
    u.user_id = s.buyer_id;


--Use COUNT() OVER(PARTITION BY ...) to calculate totals while keeping individual row data.
--Always LEFT JOIN from your Master List (Users) to your Activity List (Orders).
--Keep date filters inside the CTE or ON clause to avoid deleting "Zero-Activity" users.
--Use COALESCE(..., 0) to turn empty results into professional-looking zeros.