CREATE TABLE TimesheetStaging (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    EntryDate NVARCHAR(50), -- keep as NVARCHAR for raw import
    DayOfWeek NVARCHAR(50),
    Client NVARCHAR(255),
    ClientProjectName NVARCHAR(255),
    Description NVARCHAR(255),
    BillableType NVARCHAR(100),
    Comments NVARCHAR(MAX),
    TotalHours NVARCHAR(50),
    StartTime NVARCHAR(50),
    EndTime NVARCHAR(50),
    FileName NVARCHAR(255),
    SheetName NVARCHAR(255),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
