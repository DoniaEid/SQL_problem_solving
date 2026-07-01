SELECT distinct num AS ConsecutiveNums
FROM Logs L
WHERE num = (
    SELECT num
    FROM Logs V
    WHERE V.id = L.id + 1
)
AND num = (
    SELECT num
    FROM Logs V
    WHERE V.id = L.id + 2
);




