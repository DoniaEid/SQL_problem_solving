select 
    S.student_id, 
    S.student_name, 
    su.subject_name, 
    count(E.subject_name) As attended_exams 
from Students S 
join Subjects su 
left join Examinations E 
    on S.student_id = E.student_id 
    and su.subject_name = E.subject_name
group by S.student_id, S.student_name, su.subject_name
order by S.student_id, su.subject_name;





