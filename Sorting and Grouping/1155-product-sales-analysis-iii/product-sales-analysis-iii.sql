WITH FirstYearPerProduct AS (
    SELECT product_id, MIN(year) as min_year
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN FirstYearPerProduct fyp ON s.product_id = fyp.product_id 
                             AND s.year = fyp.min_year;