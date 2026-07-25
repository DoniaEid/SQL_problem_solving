SELECT T1.id,
    (CASE 
        WHEN T1.p_id IS NULL THEN 'Root'
        WHEN (SELECT COUNT(p_id) FROM Tree T2 WHERE T2.p_id = T1.id) >0 THEN 'Inner'
        ELSE 'Leaf'
    END )AS type
FROM Tree T1;












