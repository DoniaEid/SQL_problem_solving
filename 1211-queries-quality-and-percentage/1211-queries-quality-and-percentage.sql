with poor_query As (
   select 
    round(sum(case when Q.rating < 3 then 1 else 0 end) * 100.0 / count(*) ,2)As poor_query_percentage, 
    query_name
   from Queries Q
   group by Q.query_name
),
quality As  (
    select round(sum(rating/position)/count(*),2) As  quality, query_name
    from Queries Q
    group by Q. query_name
 )

Select   quality. query_name,  quality ,  poor_query_percentage
from  quality inner join poor_query 
on quality .query_name = poor_query .query_name 












