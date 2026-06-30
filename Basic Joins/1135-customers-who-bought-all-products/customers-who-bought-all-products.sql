# Write your MySQL query statement below
select customer_id  
from Customer c
group by  customer_id  
having count(DISTINCT c.product_key)=(select count(*) from product )





