SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
WHERE 
    (SELECT COUNT(*)
     FROM Insurance i2
     WHERE i2.tiv_2015 = i.tiv_2015) > 1
AND
    (SELECT COUNT(*)
     FROM Insurance i3
     WHERE i3.lat = i.lat AND i3.lon = i.lon) = 1;

