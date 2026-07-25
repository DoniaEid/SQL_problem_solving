# Write your MySQL query statement below

(select  U.name as results
from Users U inner join MovieRating M 
on M.user_id=U.user_id
group by U.user_id
order by count(M.movie_id) desc,U.name asc
limit 1
)
 union all
(
select  M.title  as results
from Movies M
inner join MovieRating Mo
on M.movie_id =Mo.movie_id 
where Mo.created_at between '2020-02-01' and '2020-02-29'
group by M.movie_id
order by avg(Mo.rating) desc ,M.title asc
limit 1
);









