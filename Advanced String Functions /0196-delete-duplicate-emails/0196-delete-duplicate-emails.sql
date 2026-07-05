with cte as
(
    select * from Person
)

DELETE FROM Person
WHERE id not IN (
    SELECT MIN(id)
    FROM cte
    GROUP BY email
);





