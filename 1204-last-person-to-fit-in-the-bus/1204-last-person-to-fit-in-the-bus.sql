SELECT person_name
FROM Queue Q
WHERE (
    SELECT SUM(weight)
    FROM Queue e
    WHERE e.turn <= Q.turn
) <= 1000
ORDER BY Q.turn desc
limit 1







