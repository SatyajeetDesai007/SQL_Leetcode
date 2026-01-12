WITH product_info AS (
    SELECT 
        COALESCE(p.product_name,'Unknown Product') AS product_name,
        s.year,
        s.price 
    FROM 
        Sales s
    LEFT JOIN 
        Product p
    ON
        s.product_id  = p.product_id 
)
SELECT 
    product_name,
    year,
    price
FROM 
    product_info;

--Use COALESCE as a safety net to replace NULL values with human-readable defaults (like 'Unknown').