-- Step 1: Create a database
CREATE DATABASE EmployeeDB;
GO

-- Step 2: Use the database
USE EmployeeDB;
GO

-- Step 3: Create a table named Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-increment primary key
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2)
);
GO
