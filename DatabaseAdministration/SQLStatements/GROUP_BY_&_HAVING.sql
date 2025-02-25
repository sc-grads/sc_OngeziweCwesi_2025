SELECT c.CustomerID,c.FirstName,c.LastName,SUM(o.Amount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName
HAVING SUM(o.Amount) > 200;