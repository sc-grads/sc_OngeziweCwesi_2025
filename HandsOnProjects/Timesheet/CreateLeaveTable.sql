CREATE TABLE Leave (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    LeaveType NVARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    NumberOfDays INT,
    ApprovalObtained NVARCHAR(10), -- Yes/No
    SickNoteProvided NVARCHAR(10), -- Yes/No
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
