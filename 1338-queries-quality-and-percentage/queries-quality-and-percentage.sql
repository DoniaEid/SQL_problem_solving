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









-- WITH poor_query AS (
--     SELECT 
--         query_name, 
--         COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Queries Q2 WHERE Q2.query_name = Q1.query_name) AS poor_query_percentage
--     FROM Queries Q1
--     WHERE rating < 3
--     GROUP BY query_name
-- ), 
-- quality AS (
--     SELECT 
--         query_name,
--        round(SUM(rating / position) / COUNT(*),2) AS quality_value
--     FROM Queries
--     GROUP BY query_name
-- )

-- SELECT 
--     q.query_name, 
--     q.quality_value,
--     p.poor_query_percentage
-- FROM quality q 
-- INNER JOIN poor_query p ON q.query_name = p.query_name;








