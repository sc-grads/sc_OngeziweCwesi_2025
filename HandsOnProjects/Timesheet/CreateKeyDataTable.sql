CREATE TABLE KeyData (
    KeyID INT IDENTITY(1,1) PRIMARY KEY,
    RowLabel NVARCHAR(255), -- e.g., C. Steinweg, Conekt AGSA SharePoint
    Base3 NVARCHAR(255),
    Interviews NVARCHAR(255),
    Training NVARCHAR(255),
    Aubrey NVARCHAR(255),
    WiFi NVARCHAR(255),
    Phone NVARCHAR(255),
    FileName NVARCHAR(255),
    SheetName NVARCHAR(100),
    LoadTimestamp DATETIME DEFAULT GETDATE()
);
