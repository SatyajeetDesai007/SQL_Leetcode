SELECT DISTINCT author_id AS id 
FROM Views
WHERE author_id IN (
    SELECT viewer_id     
    FROM Views
    WHERE author_id = viewer_id
    )
ORDER BY id ASC;

--Filters for authors whose IDs appear IN the list of viewers who matched the author, effectively identifying self-views through a membership check