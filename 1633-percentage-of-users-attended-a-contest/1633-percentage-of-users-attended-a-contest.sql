# Write your MySQL query statement below

select R.contest_id ,ROUND(COUNT(R.user_id) * 100 / (SELECT COUNT(*) FROM Users), 2) AS percentage
from Users U inner join Register R
on U.user_id=R.user_id
group by  contest_id 
ORDER BY percentage DESC, contest_id ASC;


