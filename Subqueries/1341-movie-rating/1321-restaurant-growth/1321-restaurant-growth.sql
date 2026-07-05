SELECT DISTINCT
    DATEADD(DAY, 6, V.visited_on) AS visited_on,
    (
        SELECT SUM(amount)
        FROM Customer C
        WHERE C.visited_on BETWEEN V.visited_on
                               AND DATEADD(DAY, 6, V.visited_on)
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount)
            FROM Customer C
            WHERE C.visited_on BETWEEN V.visited_on
                                   AND DATEADD(DAY, 6, V.visited_on)
        ) / 7.0, 2
    ) AS average_amount
FROM Customer V
WHERE DATEADD(DAY, 6, V.visited_on) <=
      (SELECT MAX(visited_on) FROM Customer)
ORDER BY visited_on;