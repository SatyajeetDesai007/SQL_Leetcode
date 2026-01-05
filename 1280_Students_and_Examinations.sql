SELECT DISTINCT
    s.student_id,
    s.student_name,
    su.subject_name,
    COUNT(e.student_id )OVER(PARTITION BY s.student_id, e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects su
LEFT JOIN 
    Examinations e
ON 
    s.student_id = e.student_id 
AND
    su.subject_name = e.subject_name 
ORDER BY 
    s.student_id, su.subject_name;

--Flow of Execution
--Create a list of all Student + Subject pairs (The Cross Join).
--Attach the actual Exam records using a Left Join.
--(WINDOW)For every row, look at the group of rows belonging to that specific Student and Subject.
--(COUNT): Tally up how many non-null exam entries exist in that group.
--Use DISTINCT to make sure we don't show the same Student-Subject result more than once.
