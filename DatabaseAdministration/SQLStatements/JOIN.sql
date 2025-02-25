SELECT c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
GO


SELECT c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
GO


SELECT c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
GO