WITH t AS (
    SELECT x, y, z
    FROM Triangle
)
SELECT
    x,y,z,
    IF(
        x + y > z AND x + z > y AND y + z > x,
        'Yes',
        'No'
    ) AS triangle
FROM t;



