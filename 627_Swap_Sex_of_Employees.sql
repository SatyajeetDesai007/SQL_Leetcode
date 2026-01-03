UPDATE salary 
SET sex = CASE 
           WHEN sex = 'm' THEN 'f'
           ELSE 'm'
        END;

--Think of CASE WHEN as a fork in the road. For every row, SQL reaches the fork, checks your condition, and takes the path (THEN) that matches. Use it whenever you need to translate codes (1 -> 'Active') or swap values ('f' -> 'm')