

WITH immediate AS (
    SELECT d2.customer_id
    FROM Delivery d1 
    INNER JOIN Delivery d2 ON d1.customer_id = d2.customer_id 
    WHERE d1.order_date = d1.customer_pref_delivery_date 
      AND d1.order_date = (SELECT MIN(c.order_date) FROM Delivery c WHERE c.customer_id = d1.customer_id) 
    GROUP BY d2.customer_id 
),

scheduled AS (
    SELECT d2.customer_id
    FROM Delivery d1 
    INNER JOIN Delivery d2 ON d1.customer_id = d2.customer_id 
    WHERE d1.order_date != d1.customer_pref_delivery_date
      AND d1.order_date = (SELECT MIN(c.order_date) FROM Delivery c WHERE c.customer_id = d1.customer_id) 
    GROUP BY d2.customer_id 
),

count_immediate AS (
    SELECT COUNT(*) AS i FROM immediate
),
count_scheduled AS (
    SELECT COUNT(*) AS s FROM scheduled
)

SELECT 
    ROUND((i / (i + s)) * 100, 2) AS immediate_percentage
FROM count_immediate, count_scheduled;



