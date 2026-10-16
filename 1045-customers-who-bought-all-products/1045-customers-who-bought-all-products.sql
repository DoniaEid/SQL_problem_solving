select  customer_id 
from Product P inner join Customer C 
on P.product_key=C.product_key
group by customer_id 

having Count(DISTINCT C.product_key)=(select count(*) from Product)









