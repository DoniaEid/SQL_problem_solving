-- # Write your MySQL query statement below
-- With num as(
--     select count(distinct player_id) 
--     from Activity
-- )
-- select (round(count(distinct V.player_id)/ (select * from num),2)) as fraction
-- from Activity V
-- where (
--     select 1
--     from Activity A
--     where (A.event_date=DATE_ADD(V.event_date, INTERVAL 1 DAY)) and  V.player_id=A. player_id group by A.player_id )=1

WITH num AS (
    SELECT COUNT(DISTINCT player_id) AS total
    FROM Activity
),
first_day AS (
    SELECT player_id, MIN(event_date) AS fd
    FROM Activity
    GROUP BY player_id
)

SELECT 
    ROUND(
        COUNT(DISTINCT f.player_id) / (SELECT total FROM num),
        2
    ) AS fraction
FROM first_day f
WHERE EXISTS (
    SELECT 1
    FROM Activity a
    WHERE a.player_id = f.player_id
      AND a.event_date = DATE_ADD(f.fd, INTERVAL 1 DAY)
);







