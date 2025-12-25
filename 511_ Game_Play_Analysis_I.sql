SELECT player_id , event_date AS first_login 
FROM (
    SELECT 
    player_id ,
    event_date ,
    ROW_NUMBER()OVER (PARTITION BY player_id ORDER BY event_date) AS row_no 
    FROM activity
)
WHERE row_no = 1;

--PARTITION BY: Splits the table into logical sub-groups like small baxes based on a specific column.

--ORDER BY: Arranges the rows inside those boxes in a specific sequence.

--ROW_NUMBER(): Generates a continuous integer sequence  that resets every time the engine  enters a new box.