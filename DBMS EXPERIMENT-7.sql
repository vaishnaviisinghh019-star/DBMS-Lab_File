CREATE TABLE Sales (
    SaleID INT,
    CustomerID INT,
    CustomerName VARCHAR(50),
    ProductID INT,
    ProductName VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (SaleID, ProductID)
);

INSERT INTO Sales VALUES
(1, 101, 'Aman', 201, 'Laptop', 2),
(1, 101, 'Aman', 202, 'Mouse', 3),
(2, 102, 'Riya', 201, 'Laptop', 1),
(3, 103, 'Karan', 203, 'Keyboard', 2);

SELECT * FROM Sales;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE SaleDetails (
    SaleID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (SaleID, ProductID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES
(101, 'Aman'), (102, 'Riya'), (103, 'Karan');

INSERT INTO Products VALUES
(201, 'Laptop'), (202, 'Mouse'), (203, 'Keyboard');

INSERT INTO SaleDetails VALUES
(1, 201, 2), (1, 202, 3), (2, 201, 1), (3, 203, 2);

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM SaleDetails;