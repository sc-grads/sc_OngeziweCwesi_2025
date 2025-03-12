-- Update an employee's salary
USE EmployeeDB;
GO

UPDATE Employees
SET Salary = 80000.00
WHERE EmployeeID = 1;
GO

-- Verify the update
SELECT * FROM Employees WHERE EmployeeID = 1;
GO
