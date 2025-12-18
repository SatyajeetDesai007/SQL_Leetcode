SELECT 
    C.name AS Customers 
FROM 
    Customers C 
LEFT JOIN 
    Orders o
ON 
    C.id = o.customerId
WHERE 
    o.id is NULL;
