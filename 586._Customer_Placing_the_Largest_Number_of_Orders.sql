SELECT customer_number
FROM Orders
GROUP BY customer_number 
ORDER BY COUNT(order_number) DESC
LIMIT 1;

-- using GROUP BY we create group of orders of similar customer number and then COUNT it.
-- ORDER BY help to arrange in decreament manner . and using LIMIT we pick only high value count