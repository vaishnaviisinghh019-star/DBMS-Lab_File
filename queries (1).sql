-- 1. Create Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

-- 2. Create Employee Table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept_ID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 3. Create Project Table
CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(50),
    Budget DECIMAL(12, 2)
);

-- 4. Insert Department Data
INSERT INTO Department (Dept_ID, Dept_Name) VALUES 
(1, 'HR'),
(2, 'Engineering');

-- 5. Add Project_ID Column to Employee
ALTER TABLE Employee ADD COLUMN Project_ID INT;

-- 6. Insert Employee Data
INSERT INTO Employee (Emp_ID, Emp_Name, Dept_ID, Salary, Project_ID) VALUES 
(101, 'Alice', 1, 85000.00, 201),
(102, 'Bob', 2, 90000.00, 202);

-- 7. Insert Project Data
INSERT INTO Project (Project_ID, Project_Name, Budget) VALUES 
(201, 'Website Redesign', 900000.00),
(202, 'Mobile App', 950000.00);

-- QUERY 7 – SIMULATED INTERSECT USING EXISTS
SELECT 
    e.Emp_ID, 
    e.Emp_Name 
FROM Employee e 
WHERE e.Salary > 80000 
  AND EXISTS (
    SELECT 1 
    FROM Project p 
    WHERE p.Project_ID = e.Project_ID 
      AND p.Budget > 800000
);

SELECT 
    e.Emp_ID, 
    e.Emp_Name, 
    e.Project_ID 
FROM Employee e 
WHERE NOT EXISTS 
( 
    SELECT 1 
    FROM Project p 
    WHERE p.Project_ID = e.Project_ID 
    AND p.Project_Name = 'AI Chatbot' 
); 

EXPLAIN 
SELECT 
    e.Emp_ID, 
    e.Emp_Name, 
    d.Dept_Name 
FROM Employee e 
INNER JOIN Department d 
ON e.Dept_ID = d.Dept_ID; 

EXPLAIN 
SELECT 
    d.Dept_Name, 
    e.Emp_Name 
FROM Department d 
LEFT JOIN Employee e 
ON d.Dept_ID = e.Dept_ID; 

EXPLAIN 
SELECT 
    e.Emp_ID, 
    e.Emp_Name, 
    e.Salary 
FROM Employee e 
WHERE e.Salary > 
( 
    SELECT AVG(e2.Salary) 
    FROM Employee e2 
    WHERE e2.Dept_ID = e.Dept_ID 
); 

EXPLAIN 
SELECT 
    e.Emp_Name, 
    d.Dept_Name, 
    p.Project_Name 
FROM Employee e 
INNER JOIN Department d 
ON e.Dept_ID = d.Dept_ID 
INNER JOIN Project p 
ON e.Project_ID = p.Project_ID; 
 
EXPLAIN 
SELECT 
    e.Emp_ID, 
    e.Emp_Name, 
    d.Dept_Name 
FROM Employee e 
INNER JOIN Department d 
ON e.Dept_ID = d.Dept_ID; 
 
EXPLAIN 
SELECT 
    e.Emp_ID, 
    e.Emp_Name, 
    e.Salary 
FROM Employee e 
WHERE e.Salary > 
( 
    SELECT AVG(e2.Salary) 
    FROM Employee e2 
    WHERE e2.Dept_ID = e.Dept_ID 
); 
 
