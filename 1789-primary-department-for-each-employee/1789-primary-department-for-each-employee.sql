# Write your MySQL query statement below

select  E.employee_id ,E.department_id 
from Employee E
where E.primary_flag ='Y' or (E.primary_flag ='N'and (select count(department_id) from Employee Em where E.employee_id=Em.employee_id)=1)






