CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATE
);
INSERT INTO Orders VALUES
(501, 'Kevin', 'Laptop', 1, 60000, '2025-09-01'),
(502, 'Alice', 'Phone', 2, 25000, '2025-09-02'),
(503, 'Bob', 'Tablet', 1, 20000, '2025-09-03'),
(504, 'Alice', 'Laptop', 1, 60000, '2025-09-04'),
(505, 'Charlie', 'Phone', 3, 25000, '2025-09-05'),
(506, 'Kevin', 'Tablet', 2, 20000, '2025-09-06');
/*Find the total order value per customer using a CTE*?*/
WITH CustomerTotal AS (
    SELECT CustomerName, SUM(Quantity * Price) AS TotalSpent
    FROM Orders
    GROUP BY CustomerName
)
SELECT * FROM CustomerTotal;
/*Find customers who spent more than the average spending (CTE + Subquery)*/
WITH CustomerTotal AS (
    SELECT CustomerName, SUM(Quantity * Price) AS TotalSpent
    FROM Orders
    GROUP BY CustomerName
)
SELECT CustomerName, TotalSpent
FROM CustomerTotal
WHERE TotalSpent > (SELECT AVG(TotalSpent) FROM CustomerTotal);
/*Rank customers by total spending (using CTE with Window Function)*/
WITH CustomerTotal AS (
    SELECT CustomerName, SUM(Quantity * Price) AS TotalSpent
    FROM Orders
    GROUP BY CustomerName
)
SELECT CustomerName, TotalSpent,
       RANK() OVER (ORDER BY TotalSpent DESC) AS RankBySpending
FROM CustomerTotal;
