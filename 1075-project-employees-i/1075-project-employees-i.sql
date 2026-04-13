# Write your MySQL query statement below



select project_id ,round(avg(experience_years),2)AS  average_years
 
 from Project P left join Employee E
 on P.employee_id=E.employee_id
 group by project_id










