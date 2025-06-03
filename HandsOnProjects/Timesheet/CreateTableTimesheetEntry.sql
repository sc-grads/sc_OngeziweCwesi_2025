CREATE TABLE TimesheetEntry (
    EntryID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
    WorkDate DATE NOT NULL,
    TaskDescription NVARCHAR(255),
    ProjectName NVARCHAR(100),
    HoursWorked DECIMAL(4,2),
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
