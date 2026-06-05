# Write your MySQL query statement below
select customer_id  
from Customer c inner join product p
on c.product_key=p.product_key
group by  customer_id  
having count(DISTINCT c.product_key)=(select count(*) from product )





