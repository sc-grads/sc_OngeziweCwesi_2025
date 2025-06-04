CREATE TABLE Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    EntryDate DATE,
    DayOfWeek NVARCHAR(20),
    Client NVARCHAR(100),
    ClientProjectName NVARCHAR(150),
    Description NVARCHAR(255),
    BillableType NVARCHAR(50), -- Billable or Non-Billable
    Comments NVARCHAR(MAX),
    TotalHours TIME,
    StartTime TIME,
    EndTime TIME,
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
