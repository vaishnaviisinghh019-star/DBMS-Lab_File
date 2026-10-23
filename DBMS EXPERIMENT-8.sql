CREATE TABLE Bank (
    AccountID INT PRIMARY KEY,
    Name VARCHAR(50),
    Balance DECIMAL(10,2)
);

INSERT INTO Bank VALUES
(101, 'Aman', 5000),
(102, 'Riya', 3000);

SELECT * FROM Bank;

START TRANSACTION;

UPDATE Bank
SET Balance = Balance - 1000
WHERE AccountID = 101;

UPDATE Bank
SET Balance = Balance + 1000
WHERE AccountID = 102;

COMMIT;

SELECT * FROM Bank;

START TRANSACTION;

UPDATE Bank
SET Balance = Balance - 500
WHERE AccountID = 101;

SAVEPOINT S1;

UPDATE Bank
SET Balance = Balance + 500
WHERE AccountID = 102;

ROLLBACK TO S1;

COMMIT;

SELECT * FROM Bank;