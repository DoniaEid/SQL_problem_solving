# Write your MySQL query statement below
select employee_id  
from  Employees E
where salary<30000 and E.manager_id not in
 (
    select  e.employee_id
    from Employees e
  )
order by E.employee_id




