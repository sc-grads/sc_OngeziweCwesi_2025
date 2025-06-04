CREATE TABLE SheetAuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    TableName NVARCHAR(100),
    Status NVARCHAR(50), -- e.g., Success, Error
    RowsInserted INT,
    ErrorMessage NVARCHAR(500),
    StartedAt DATETIME,
    CompletedAt DATETIME
);
