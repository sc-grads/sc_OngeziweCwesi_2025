CREATE TABLE LeaveRecord (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
    DateFrom DATE,
    DateTo DATE,
    LeaveType NVARCHAR(50),
    Reason NVARCHAR(255),
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
