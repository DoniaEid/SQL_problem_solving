
select P.product_name,sum(O.unit) as unit
from Products P inner join Orders O
on P.product_id=O.product_id
where month(order_date)=2 and year(order_date)=2020
group by O.product_id,P.product_name
having unit>=100




