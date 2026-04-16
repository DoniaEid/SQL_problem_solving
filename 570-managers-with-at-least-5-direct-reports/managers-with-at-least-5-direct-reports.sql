-- SELECT name 
-- FROM Employee 
-- WHERE id IN (
--     SELECT managerId 
--     FROM Employee 
--     GROUP BY managerId 
--     HAVING COUNT(id) >= 5
-- );


WITH HeavyManagers AS (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)

SELECT E.name
FROM Employee E
JOIN HeavyManagers HM ON E.id = HM.managerId;