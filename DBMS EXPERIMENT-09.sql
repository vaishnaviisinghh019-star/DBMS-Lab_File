CREATE TABLE RailwayBooking (
    BookingID INT PRIMARY KEY,
    PassengerName VARCHAR(50),
    TrainNo INT,
    SeatNo INT,
    JourneyDate DATE
);

SET SESSION cte_max_recursion_depth = 6000;

INSERT INTO RailwayBooking
WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 5000
)
SELECT
    n,
    CONCAT('Passenger', n),
    100 + (n % 20),
    n % 100 + 1,
    DATE_ADD('2026-01-01', INTERVAL (n % 365) DAY)
FROM Numbers;

SELECT COUNT(*) AS TotalRecords
FROM RailwayBooking;

EXPLAIN
SELECT * FROM RailwayBooking
WHERE TrainNo = 105;

CREATE INDEX idx_train
ON RailwayBooking(TrainNo);

SELECT * FROM RailwayBooking
WHERE TrainNo = 105;
