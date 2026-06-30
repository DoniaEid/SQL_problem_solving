
select sell_date ,count( distinct  product) as num_sold ,GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') as products
from Activities
GROUP BY sell_date
order by sell_date

