-- Create the database
CREATE DATABASE TestingTimesheetDB;
GO

-- Select the database context
USE TestingTimesheetDB;
GO

-- ========================
-- Table: AuditLog
-- ========================
CREATE TABLE dbo.AuditLog (
    AuditLogID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName NVARCHAR(255) NOT NULL,
    FileName NVARCHAR(255) NULL,
    AuditType NVARCHAR(255) NULL,
    PackageName NVARCHAR(255) NULL,
    TaskName NVARCHAR(255) NULL,
    RowsLoaded INT NULL,
    RunDate DATETIME NULL DEFAULT GETDATE(),
    ExecutedBy NVARCHAR(255) NULL
);
GO

-- ========================
-- Table: Client
-- ========================
CREATE TABLE dbo.Client (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(150) NOT NULL UNIQUE
);
GO

-- ========================
-- Table: Consultant
-- ========================
CREATE TABLE dbo.Consultant (
    ConsultantID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName NVARCHAR(100) NOT NULL UNIQUE
);
GO

-- ========================
-- Table: Description
-- ========================
CREATE TABLE dbo.Description (
    DescriptionID INT IDENTITY(1,1) PRIMARY KEY,
    DescriptionText NVARCHAR(255) NOT NULL UNIQUE
);
GO

-- ========================
-- Table: ErrorLog
-- ========================
CREATE TABLE dbo.ErrorLog (
    ErrorLogID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName NVARCHAR(100) NULL,
    TaskName NVARCHAR(100) NULL,
    ErrorDescription NVARCHAR(MAX) NULL,
    SourceComponent NVARCHAR(100) NULL,
    FileName NVARCHAR(255) NULL,
    ExecutedBy NVARCHAR(100) NULL,
    LoggedAt DATETIME NULL DEFAULT GETDATE()
);
GO

-- ========================
-- Table: Leave
-- ========================
CREATE TABLE dbo.Leave (
    ConsultantID INT NULL,
    DescriptionID INT NULL,
    LeaveStart DATE NULL,
    LeaveEnd DATE NULL,
    NumberOfDays DECIMAL(5,2) NULL,
    ApprovalObtained CHAR(10) NULL,
    SickNoteSubmitted CHAR(10) NULL,
    FileName NVARCHAR(MAX) NULL,
    LoadTimeStamp DATETIME NULL
);
GO

-- ========================
-- Table: LeaveStaging
-- ========================
CREATE TABLE dbo.LeaveStaging (
    Consultant NVARCHAR(255) NULL,
    DateFrom NVARCHAR(255) NULL,
    DateTo NVARCHAR(255) NULL,
    LeaveType NVARCHAR(255) NULL,
    NumberOfDays NVARCHAR(255) NULL,
    ApprovalObtained NVARCHAR(255) NULL,
    SickNoteSubmitted NVARCHAR(255) NULL,
    FileName NVARCHAR(255) NULL
);
GO

-- ========================
-- Table: Timesheet
-- ========================
CREATE TABLE dbo.Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    ConsultantID INT NOT NULL,
    EntryDate DATE NOT NULL,
    DayOfWeek NVARCHAR(255) NULL,
    ClientProjectName NVARCHAR(255) NULL,
    Description NVARCHAR(255) NULL,
    BillableType NVARCHAR(255) NULL,
    Comments NVARCHAR(MAX) NULL,
    TotalHours TIME(0) NULL,
    StartTime TIME(0) NULL,
    EndTime TIME(0) NULL,
    FileName NVARCHAR(255) NULL,
    LoadTimestamp DATETIME NULL DEFAULT GETDATE(),
    CONSTRAINT UQ_Timesheet_Row UNIQUE (
        ClientID,
        ConsultantID,
        EntryDate,
        ClientProjectName,
        Description,
        BillableType,
        TotalHours,
        StartTime,
        EndTime,
        FileName
    )
);
GO

-- ========================
-- Foreign Keys for Timesheet
-- ========================
ALTER TABLE dbo.Timesheet
ADD CONSTRAINT FK_Timesheet_Client FOREIGN KEY (ClientID)
REFERENCES dbo.Client (ClientID);

ALTER TABLE dbo.Timesheet
ADD CONSTRAINT FK_Timesheet_Consultant FOREIGN KEY (ConsultantID)
REFERENCES dbo.Consultant (ConsultantID);
GO
