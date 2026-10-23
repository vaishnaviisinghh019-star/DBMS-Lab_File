CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30)
);

SET SESSION cte_max_recursion_depth = 11000;

INSERT INTO Employee
WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 10000
)
SELECT
    n,
    CONCAT('Employee', n),
    CASE
        WHEN n % 3 = 0 THEN 'IT'
        WHEN n % 3 = 1 THEN 'HR'
        ELSE 'Sales'
    END,
    20000 + (n % 50000),
    CASE
        WHEN n % 2 = 0 THEN 'Delhi'
        ELSE 'Mumbai'
    END
FROM Numbers;

SELECT COUNT(*) AS TotalEmployees
FROM Employee;

EXPLAIN
SELECT * FROM Employee
WHERE EmpID = 100;

EXPLAIN
SELECT * FROM Employee
WHERE Department = 'IT';

EXPLAIN
SELECT * FROM Employee
WHERE Salary > 50000;

EXPLAIN
SELECT Department, AVG(Salary)
FROM Employee
GROUP BY Department;

EXPLAIN
SELECT * FROM Employee
WHERE City = 'Delhi';

CREATE INDEX idx_department
ON Employee(Department);

CREATE INDEX idx_salary
ON Employee(Salary);

CREATE INDEX idx_city
ON Employee(City);

EXPLAIN
SELECT * FROM Employee
WHERE Department = 'IT';

EXPLAIN
SELECT * FROM Employee
WHERE Salary > 50000;

EXPLAIN
SELECT * FROM Employee
WHERE City = 'Delhi';

SELECT * FROM Employee
LIMIT 10;
