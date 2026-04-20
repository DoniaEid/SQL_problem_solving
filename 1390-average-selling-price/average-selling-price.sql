SELECT 
    P.product_id, 
CASE 
    WHEN SUM(U.units) > 0 THEN ROUND(SUM(P.price * U.units) / SUM(U.units), 2)
    ELSE 0 
END AS average_price

from Prices P 
left JOIN 
    UnitsSold U ON P.product_id = U.product_id
    AND U.purchase_date BETWEEN P.start_date AND P.end_date 

GROUP BY 
    P.product_id;








