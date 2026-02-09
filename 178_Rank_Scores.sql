WITH Ranker AS(
    SELECT 
        score,
        DENSE_RANK() OVER (ORDER BY score DESC) AS rank
    FROM 
        Scores
)
SELECT 
    score,
    rank 
FROM
    Ranker;

-- We use DENSE_RANK() here instead of RANK() because if two people tie for
--1st place, the next person will be 2nd. 


-- If we used RANK(), the next person would skip to 3rd! The 'ORDER BY score DESC' 
--ensures the highest score gets rank #1.