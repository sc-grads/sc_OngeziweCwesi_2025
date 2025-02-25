SELECT * FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);
GO

SELECT SUM(Amount) AS TotalRevenue FROM Orders;
GO