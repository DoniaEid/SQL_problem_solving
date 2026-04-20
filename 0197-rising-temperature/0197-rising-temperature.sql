# Write your MySQL query statement below
SELECT id 
FROM Weather W1 
WHERE temperature > (
    SELECT temperature 
    FROM Weather W2 
    WHERE W2.recordDate = SUBDATE(W1.recordDate, 1)
);