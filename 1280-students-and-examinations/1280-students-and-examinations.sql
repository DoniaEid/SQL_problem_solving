SELECT st.student_id,
       st.student_name,
       sub.subject_name,
       COUNT(E.subject_name) AS attended_exams
FROM Students st
CROSS JOIN Subjects sub
LEFT JOIN Examinations E
    ON st.student_id = E.student_id
    AND sub.subject_name = E.subject_name
GROUP BY st.student_id, st.student_name, sub.subject_name
ORDER BY st.student_id, sub.subject_name;



















