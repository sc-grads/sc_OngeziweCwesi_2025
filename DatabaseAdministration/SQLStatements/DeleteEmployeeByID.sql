-- Delete an employee by ID
USE EmployeeDB;
GO

DELETE FROM Employees
WHERE EmployeeID = 3;
GO

-- Verify deletion
SELECT * FROM Employees;
GO
