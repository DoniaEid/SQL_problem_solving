# Write your MySQL query statement below

select product_id, new_price  as price
from Products P
where change_date =(
     select max(change_date)
     from Products V
     where change_date <= '2019-08-16'  and V.product_id=P.product_id
    )

group by  product_id 

UNION

SELECT DISTINCT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);









