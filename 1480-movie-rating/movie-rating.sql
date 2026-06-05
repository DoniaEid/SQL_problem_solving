WITH rated_greatest AS (
    SELECT u.name
    FROM Users u
    INNER JOIN MovieRating m
        ON u.user_id = m.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(m.movie_id) DESC, u.name ASC
    LIMIT 1
),

highest_average AS (
    SELECT m.title
    FROM Movies m
    INNER JOIN MovieRating mr
    ON mr.movie_id = m.movie_id
    WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
)

SELECT name AS results
FROM rated_greatest
UNION ALL
SELECT title AS results
FROM highest_average;