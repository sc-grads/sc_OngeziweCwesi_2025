CREATE TABLE ExpenseClaim (
    ClaimID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
    ExpenseType NVARCHAR(100),
    Amount DECIMAL(10,2),
    ExpenseDate DATE,
    Description NVARCHAR(255),
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
