-- Insert sample records into the Employees table
USE EmployeeDB;
GO

INSERT INTO Employees (FirstName, LastName, Email, JobTitle, Salary)
VALUES 
('John', 'Doe', 'john.doe@example.com', 'Software Engineer', 75000.00),
('Jane', 'Smith', 'jane.smith@example.com', 'Data Analyst', 68000.00),
('Michael', 'Brown', 'michael.brown@example.com', 'System Admin', 72000.00);
GO
