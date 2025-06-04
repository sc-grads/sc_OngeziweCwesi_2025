CREATE TABLE ExpenseClaim (
    ExpenseClaimID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    ClaimMonth DATE,
    ExpenseDescription NVARCHAR(255),
    ExpenseType NVARCHAR(100),
    Amount DECIMAL(10,2),
    Notes NVARCHAR(500),
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
