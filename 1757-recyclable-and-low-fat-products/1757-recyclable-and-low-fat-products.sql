# Write your MySQL query statement below
# first solution
-- select product_id 
-- from products p
-- where p.low_fats =  'Y' and p.recyclable='Y'

# second solution
SELECT product_id 
FROM Products
WHERE low_fats LIKE 'Y%' 
  AND recyclable LIKE 'Y%';



