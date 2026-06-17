WITH Low_Salary AS (
    SELECT COUNT(*) AS cnt
    FROM Accounts
    WHERE income < 20000
),
Average_Salary AS (
    SELECT COUNT(*) AS cnt
    FROM Accounts
    WHERE income BETWEEN 20000 AND 50000
),
High_Salary AS (
    SELECT COUNT(*) AS cnt
    FROM Accounts
    WHERE income > 50000
)

SELECT 'Low Salary' AS category, cnt AS accounts_count
FROM Low_Salary

UNION

SELECT 'Average Salary', cnt
FROM Average_Salary

UNION

SELECT 'High Salary', cnt
FROM High_Salary;