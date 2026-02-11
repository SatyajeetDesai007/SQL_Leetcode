WITH productrank AS(
    SELECT 
        product_id ,
        year,
        quantity,
        price,
        RANK()OVER(PARTITION BY product_id ORDER BY year ASC ) AS rank
    FROM 
        Sales 
)
SELECT 
    product_id,
    year AS first_year,
    quantity,
    price 
FROM 
    productrank
WHERE 
    rank = 1;

-- for filteration we use window function here, in which we separate data on basis of 
-- product and year(asc order) and give then rank using rank function. 